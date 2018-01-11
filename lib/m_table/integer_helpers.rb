module MTable
  module IntegerHelpers # :nodoc:
    def prime?(integer)
      divisors = (1..integer.to_i).to_a.select { |elem| (integer % elem).zero? }

      divisors.count == 2
    end
  end
end
