module MTable
  class FibonacciSequence
    include Enumerable

    attr_reader :size

    def initialize(size: size)
      @size = size
    end

    def each
      if block_given?
        (1..size).each { |element| yield(fibonacci_number(element)) }
      else
        enum_for(:each)
      end
    end

    private

    def fibonacci_number(number)
      return 1 if number == 1 || number == 2

      fibonacci_number(number - 1) + fibonacci_number(number - 2)
    end
  end
end
