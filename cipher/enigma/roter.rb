class Roter
  ALP_ARR = ("A".."Z").to_a.freeze

  attr_reader :scrambler, :message_key, :init_roter
  attr_accessor :rotation_cnt

  def initialize(scrambler:, message_key:)
    @message_key = message_key
    validate_message_key!

    @scrambler = scrambler&.uniq || make_random_scrambler
    validate_scrambler!

    @init_roter = make_init_roter
    @rotation_cnt = 0
  end

  def rotation
    self.rotation_cnt += 1
  end

  def rotated_roter
    init_roter.rotate(rotation_cnt)
  end

  private

    def validate_message_key!
      raise "message key is invalid. upcase alphabet values only." unless ("A".."Z").include?(@message_key)
    end

    def validate_scrambler!
      raise "scrambler is invalid" if
        @scrambler.size != 26 ||
        !@scrambler.select { |v| !(0..(ALP_ARR.size - 1)).include?(v) }.empty?
    end

    def make_random_scrambler
      (0..(ALP_ARR.size - 1)).to_a.shuffle
    end

    def make_init_roter
      idx = ALP_ARR.find_index(@message_key)
      lead_idx = @scrambler.find_index(idx)
      @scrambler.rotate(lead_idx)
    end
end
