require './enigma'

enigma = Enigma.new(key_word: "XYZ")
enigma.encrypt(code: "AAAAAA")
enigma.decrypt(encrypted_code: enigma.encrypted_code)
p enigma
