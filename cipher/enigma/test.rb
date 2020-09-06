require './enigma'

enigma = Enigma.new(key_word: "XYZ")
enigma.encrypt(code: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA") # length = 30
enigma.decrypt(encrypted_code: enigma.encrypted_code)
p enigma
