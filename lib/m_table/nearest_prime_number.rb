module MTable
  # Finds the first prime number after `input_number`.
  class NearestPrimeNumber
    include IntegerHelpers

    attr_reader :input_integer

    def initialize(input_integer)
      @input_integer = input_integer
    end

    def to_i
      return input_integer if prime?(input_integer)

      NearestPrimeNumber.new(input_integer.succ).to_i
    end
  end
end
