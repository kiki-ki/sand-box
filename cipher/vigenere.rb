module Cipher
  module Vigenere
    module_function

    ALF_SIZE = 26.freeze
    ALF_ARR = ("A".."Z").to_a.freeze
    VIGENERE_SQUARE = ALF_SIZE.times.map { |i| ALF_ARR.rotate(i) }.freeze

    def encrypt(key:, code:)
      key_arr = key.split("")

      code.split("").each_with_index.map do |c, i|
        k_c = key_arr[i % key.length]
        key_idx = ALF_ARR.find_index(k_c)
        code_idx = ALF_ARR.find_index(c)
        VIGENERE_SQUARE[code_idx][key_idx]
      end.join
    end

    def decrypt(key:, code:)
      key_arr = key.split("")

      code.split("").each_with_index.map do |c, i|
        k_c = key_arr[i % key.length]
        key_idx = ALF_ARR.find_index(k_c)
        code_idx = VIGENERE_SQUARE[key_idx].find_index(c)
        ALF_ARR[code_idx]
      end.join
    end
  end
end
