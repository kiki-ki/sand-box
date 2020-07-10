require 'yaml'
require 'rest-client'
require 'active_support'
require 'active_support/core_ext'

class User
  attr_reader *%i(id pass token)

  def initialize
    info = YAML.load_file("config/secret.yml")["hello_work"]
    @id = info["id"]
    @pass = info["pass"]
  end

  def token
    @token ||= get_token
  end

  def destroy_token
    RestClient.post(
      'https://teikyo.hellowork.mhlw.go.jp/teikyo/api/2.0/auth/delToken',
      token
    )
    self.token = nil
  end

  private
    def get_token
      res = RestClient.post(
        'https://teikyo.hellowork.mhlw.go.jp/teikyo/api/2.0/auth/getToken',
        { id: id, pass: pass }
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

  def get_kyujin(data_id)
    list = get_kyujin_list
    kyujin = list.select { |k| k["data_id"] == data_id }.first
    pass = kyujin["link"]["href"]
    res = RestClient.post(pass, token)
    Hash.from_xml(res.body)
  end
end
