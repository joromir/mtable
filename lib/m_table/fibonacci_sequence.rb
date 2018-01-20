module MTable
  class FibonacciSequence
    include Enumerable
    include IntegerHelpers

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
  end
end
