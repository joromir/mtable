module MTable
  module IntegerHelpers
    def prime?(integer)
      divisors = (1..integer.to_i).to_a.select { |elem| integer % elem == 0 }

      divisors.count == 2
    end
  end
end
