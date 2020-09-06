class PlugBoard
  ALP_ARR = ("A".."Z").to_a.freeze

  attr_reader :plug_board

  def initialize(plug_board:)
    @plug_board = plug_board
    validate_plug_board!
  end

  private

    def validate_plug_board!
      arr = plug_board.keys.map(&:to_s) + plug_board.values

      raise "plug board is invalid" if
        plug_board.size > ALP_ARR.size / 2 ||
        !arr.select { |v| !v.match?(/[A-Z]/) }.empty?
        arr.size != arr.uniq.size
    end
end