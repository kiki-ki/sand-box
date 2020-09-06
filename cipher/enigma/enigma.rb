require './roter'

class Enigma
  class Encrypter
    ALP_ARR = ("A".."Z").to_a.freeze

    attr_reader :code, :encrypted_code
    attr_accessor :roter1, :roter2, :roter3

    def initialize(scrambler1: nil, scrambler2: nil, scrambler3: nil)
      @roter1 = Roter.new(scrambler: scrambler1)
      @roter2 = Roter.new(scrambler: scrambler2)
      @roter3 = Roter.new(scrambler: scrambler3)
    end

    def encrypt(code:)
      @code = code
      u_code = code.upcase
      @encrypted_code = u_code.split('').map do |c|
        return c unless c.match?(/[A-Z]/)

        key = ALP_ARR.find_index(c)
        key1 = roter1.rotated_scramble[key]
        key2 = roter2.rotated_scramble[key1]
        key3 = roter3.rotated_scramble[key2]

        ref_key = ((ALP_ARR.size - 1) - key3)
        roter3_ref_key = roter3.rotated_scramble.find_index(ref_key)
        roter2_ref_key = roter2.rotated_scramble.find_index(roter3_ref_key)
        roter1_ref_key = roter1.rotated_scramble.find_index(roter2_ref_key)

        roter1.rotate
        roter2.rotate if (roter1.rotation_cnt % 26).zero?
        roter3.rotate if (roter2.rotation_cnt % 26).zero?

        ALP_ARR[roter1_ref_key]
      end.join
    end
  end

  class Decrypter

  end
end

encrypter = Enigma::Encrypter.new
p encrypter.roter1
p encrypter.roter2
p encrypter.roter3
encrypter.encrypt(code: "aaaa")
puts encrypter.encrypted_code

