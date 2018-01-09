module MTable
  # Invoke MTable::PrimeSequence.new(size: given_size) to get
  # the first `given_size` prime numbers.
  class PrimeSequence
    attr_reader :size

    def initialize(size:)
      @size = size
    end

    def to_a
      return [] if size.zero?

      primes = [2]

      (size - 1).times do
        primes << NearestPrimeNumber.new(primes.last.succ).to_i
      end

      primes
    end
  end
end
