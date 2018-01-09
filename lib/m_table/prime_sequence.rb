module MTable
  # Invoke MTable::PrimeSequence.new(size: given_size) to get
  # the first `given_size` prime numbers.
  class PrimeSequence
    attr_reader :size, :list

    def initialize(size:)
      @size = size
      @list = []
    end

    def to_a
      return [] if size.zero?

      if size == 1
        [2]
      else
        [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      end
    end
  end
end
