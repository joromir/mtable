module MTable
  module IntegerHelpers # :nodoc:
    def prime?(integer)
      (1..integer.to_i).select { |elem| (integer % elem).zero? }.count == 2
    end
  end
end
