require './enigma'

encrypter = Enigma::Encrypter.new(key_word: "XYZ")
p encrypter.plug_board
p encrypter.roter1
p encrypter.roter2
p encrypter.roter3
encrypter.encrypt(code: "aaaa")
puts encrypter.encrypted_code