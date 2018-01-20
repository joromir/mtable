module MTable
  class FibonacciSequence
    include Enumerable
    include IntegerHelpers

    attr_reader :size

    def initialize(size: size)
      @size = size
    end

    def each
      return enum_for(:each) unless block_given?

      (1..size).each { |element| yield(fibonacci_number(element)) }
    end
  end
end
