## シーザー暗号(ceaser.rb)
ex)
```ruby
code = "AB cd"
shift_num = 3
is_left = true

puts code
# => AB cd

encrypted_code = Cipher::Ceaser.encrypt(code: code, shift_num: shift_num, is_left: is_left)

puts encrypted_code
# => YZ ab

decrypted_code = Cipher::Ceaser.decrypt(code: encrypted_code, shift_num: shift_num, is_left: is_left)

puts decrypted_code
# => AB cd
```

## ヴィジュネル暗号(vigenere.rb)
ex)
```ruby
key = "ARM"
code = "CODE"

puts code
# => CODE

encrypted_code =  Cipher::Vigenere.encrypt(key: key, code: code)

puts encrypted_code
# => CFPE

decrypted_code =  Cipher::Vigenere.decrypt(key: key, code: encrypted_code)

puts decrypted_code
# => CODE
```
