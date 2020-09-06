class Roter
  ALP_ARR = ("A".."Z").to_a.freeze

  attr_reader :scrambler
  attr_accessor :rotated_scrambler, :rotation_cnt

  def initialize(scrambler:)
    @scrambler = scrambler || make_random_scrambler
    @rotation_cnt = 0
  end

  def rotated_scramble
    scrambler.rotate(rotation_cnt)
  end

  private

    def make_random_scrambler
      arr = (0..ALP_ARR.size).map(&:to_s).to_a.shuffle
      ALP_ARR.size.times.map { |i| [i.to_s, arr[i]] }.to_h
    end
end
