class PlugBoard
  ALP_ARR = ("A".."Z").to_a.freeze

  attr_reader :list, :plug_patterns

  def initialize(plug_patterns:)
    @plug_patterns = plug_patterns.map { |k, v| [k.to_s, v] }.to_h
    validate_plug_patterns!
    @list = make_plug_board_list(plug_patterns)
  end

  private

    def validate_plug_patterns!
      arr = plug_patterns.keys.map(&:to_s) + plug_patterns.values

      raise "plug board is invalid" if
        plug_patterns.size > ALP_ARR.size / 2 ||
        !arr.select { |v| !v.match?(/[A-Z]/) }.empty?
        arr.size != arr.uniq.size
    end

    def make_plug_board_list(plug_patterns)
      arr = ALP_ARR.dup

      plug_patterns.each do |k, v|
        a_idx = ALP_ARR.find_index(k)
        b_idx = ALP_ARR.find_index(v)
        arr[a_idx] = v
        arr[b_idx] = k
      end

      arr
    end
end