module Cipher
  class Enigma
    ALF_ARR = ("A".."Z").to_a.freeze

    attr_reader :plug_board

    def initialize(plug_board: make_random_plug_board)
      @plug_board = plug_board
    end

    private

      def make_random_plug_board
        unused = ("A".."Z").to_a
        ALF_ARR.map do |alp|
          v = unused.sample
          unused.delete(v)
          [alp.to_sym, v]
        end.to_h
      end
  end
end
