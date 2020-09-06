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

        key = ALP_ARR.find_index(c).to_s
        roter1_res = roter1.rotated_scramble[key]
        roter2_res = roter2.rotated_scramble[roter1_res]
        roter3_res = roter3.rotated_scramble[roter2_res]

        reflect_key = ((ALP_ARR.size - 1) - roter3_res.to_i).to_s
        roter3_ref_res = roter3.rotated_scramble.invert[reflect_key]
        roter2_ref_res = roter2.rotated_scramble.invert[roter3_ref_res]
        roter1_ref_res = roter1.rotated_scramble.invert[roter2_ref_res]

        roter1.rotation_cnt += 1
        roter2.rotation_cnt += 1 if (roter1.rotation_cnt % 26).zero?
        roter3.rotation_cnt += 1 if (roter2.rotation_cnt % 26).zero?

        ALP_ARR[roter1_ref_res.to_i]
      end
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

