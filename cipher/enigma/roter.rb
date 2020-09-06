class Roter
  ALP_ARR = ("A".."Z").to_a.freeze

  attr_reader :scrambler
  attr_accessor :rotation_cnt

  def initialize(scrambler:)
    @scrambler = scrambler || make_random_scrambler
    @rotation_cnt = 0
  end

  def rotate
    self.rotation_cnt += 1
  end

  def rotated_scramble
    scrambler.rotate(rotation_cnt)
  end

  private

    def make_random_scrambler
      (0..(ALP_ARR.size - 1)).to_a.shuffle
    end
end
