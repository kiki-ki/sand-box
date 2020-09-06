```sh
$ ruby test.rb
=>
#<Enigma:0x00007faf1c0d13d0

  @plug_board=#<PlugBoard:0x00007faf1c0d1358
    @plug_patterns={},
    @list=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  >,
  
  @roter1=#<Roter:0x00007faf1c0d1088
    @message_key="X",
    @scrambler=[1, 3, 22, 13, 9, 19, 20, 7, 5, 25, 14, 8, 15, 23, 11, 12, 6, 18, 16, 0, 21, 17, 2, 4, 24, 10],
    @init_roter=[23, 11, 12, 6, 18, 16, 0, 21, 17, 2, 4, 24, 10, 1, 3, 22, 13, 9, 19, 20, 7, 5, 25, 14, 8, 15],
    @rotation_cnt=30
  >,
  
  @roter2=#<Roter:0x00007faf1c0d0a70
    @message_key="Y",
    @scrambler=[16, 14, 6, 21, 4, 11, 10, 17, 3, 0, 19, 20, 13, 7, 8, 25, 12, 15, 5, 24, 9, 2, 1, 18, 22, 23],
    @init_roter=[24, 9, 2, 1, 18, 22, 23, 16, 14, 6, 21, 4, 11, 10, 17, 3, 0, 19, 20, 13, 7, 8, 25, 12, 15, 5],
    @rotation_cnt=1
  >,
  
  @roter3=#<Roter:0x00007faf1c0d0458
    @message_key="Z",
    @scrambler=[15, 20, 2, 24, 14, 16, 9, 10, 3, 21, 4, 1, 7, 6, 18, 12, 17, 5, 8, 0, 23, 11, 13, 22, 19, 25],
    @init_roter=[25, 15, 20, 2, 24, 14, 16, 9, 10, 3, 21, 4, 1, 7, 6, 18, 12, 17, 5, 8, 0, 23, 11, 13, 22, 19],
    @rotation_cnt=0
  >,
  
  @code="AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
  @encrypted_code="BZORBZHHPBZHNTTJMCTYJBZLRNEBZS",
  @decrypted_code="AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  
>
```
