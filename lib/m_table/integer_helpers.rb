module MTable
  module IntegerHelpers # :nodoc:
    def prime?(integer)
      (1..integer.to_i).select { |elem| (integer % elem).zero? }.count == 2
    end

    def fibonacci_number(number)
      return 1 if number == 1 || number == 2

      fibonacci_number(number - 1) + fibonacci_number(number - 2)
    end
  end
end
