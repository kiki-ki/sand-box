require './plug_board'
require './roter'

class Enigma
  class Encrypter
    ALP_ARR = ("A".."Z").to_a.freeze

    attr_reader :code, :encrypted_code,
                :plug_board, :roter1, :roter2, :roter3

    def initialize(key_word:, plug_patterns: {}, scrambler1: nil, scrambler2: nil, scrambler3: nil)
      @plug_board = PlugBoard.new(plug_patterns: plug_patterns)
      message_keys = key_word.split("")
      @roter1 = Roter.new(scrambler: scrambler1, message_key: message_keys[0])
      @roter2 = Roter.new(scrambler: scrambler2, message_key: message_keys[1])
      @roter3 = Roter.new(scrambler: scrambler3, message_key: message_keys[2])
    end

    def encrypt(code:)
      @code = code
      u_code = code.upcase

      @encrypted_code = u_code.split('').map do |c|
        if c.match?(/[A-Z]/)
          key = plug_board.list.find_index(c)
          roter1_key = roter1.rotated_roter[key]
          roter2_key = roter2.rotated_roter[roter1_key]
          roter3_key = roter3.rotated_roter[roter2_key]

          ref_key = ((ALP_ARR.size - 1) - roter3_key)
          roter3_ref_key = roter3.rotated_roter.find_index(ref_key)
          roter2_ref_key = roter2.rotated_roter.find_index(roter3_ref_key)
          roter1_ref_key = roter1.rotated_roter.find_index(roter2_ref_key)

          roter1.rotation
          roter2.rotation if (roter1.rotation_cnt % 26).zero?
          roter3.rotation if (roter2.rotation_cnt % 26).zero?

          plug_board.list[roter1_ref_key]
        else
          c
        end
      end.join
    end
  end

  class Decrypter
    ALP_ARR = ("A".."Z").to_a.freeze

    attr_reader :code, :encrypted_code,
                :plug_board, :roter1, :roter2, :roter3

    def initialize(plug_board:, scrambler1:, scrambler2:, scrambler3:)
      @plug_board = plug_board
      @scrambler1 = Roter.new
    end
  end
end

encrypter = Enigma::Encrypter.new(key_word: "XYZ")
p encrypter.plug_board
p encrypter.roter1
p encrypter.roter2
p encrypter.roter3
encrypter.encrypt(code: "aaaa")
puts encrypter.encrypted_code

