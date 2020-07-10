require 'yaml'
require 'rest-client'
require 'active_support'
require 'active_support/core_ext'

class User
  attr_reader *%i(id password token)

  def initialize
    info = YAML.load_file("config/secret.yml")["hello_work"]
    @id = info["id"]
    @password = info["password"]
  end

  def token
    @token ||= get_token
  end

  def destroy_token
    RestClient.post(
      'https://teikyo.hellowork.mhlw.go.jp/teikyo/api/2.0/auth/delToken',
      { token: token }
    )
    self.token = nil
  end

  private
    def get_token
      res = RestClient.post(
        'https://teikyo.hellowork.mhlw.go.jp/teikyo/api/2.0/auth/getToken',
        { id: id, pass: password }
      )
      Hash.from_xml(res.body)["root"]["token"]
    end
end

class ApiClient
  attr_reader :token

  def initialize
    u = User.new
    @token = u.token
  end

  def get_kyujin_list
    res = RestClient.post(
      'https://teikyo.hellowork.mhlw.go.jp/teikyo/api/2.0/kyujin',
      { token: token }
    )
    Hash.from_xml(res.body)["root"]["kyujin_list"]["data"]
  end

  def get_kyujin(data_id, page)
    list = get_kyujin_list
    tar = list.select { |i| i["data_id"] == data_id }.first
    pass = tar["link"]["href"] + "/#{page}"
    res = RestClient.post(pass, { token: token })
    Hash.from_xml(res.body)["root"]["kyujin"]["data"]
  end
end
