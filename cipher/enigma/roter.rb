class Roter
  ALP_ARR = ("A".."Z").to_a.freeze

  attr_reader :scrambler
  attr_accessor :rotation_cnt

  def initialize(scrambler:)
    @scrambler = scrambler&.uniq || make_random_scrambler
    @rotation_cnt = 0
    validate_scrambler!
  end

  def rotate
    self.rotation_cnt += 1
  end

  def rotated_scramble
    scrambler.rotate(rotation_cnt)
  end

  private

    def validate_scrambler!
      raise "scrambler is invalid" if
        scrambler.size != 26 ||
        !scrambler.select { |v| !(0..(ALP_ARR.size - 1)).include?(v) }.empty?
    end

    def make_random_scrambler
      (0..(ALP_ARR.size - 1)).to_a.shuffle
    end
end
