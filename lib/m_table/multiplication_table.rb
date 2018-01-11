module MTable
  class MultiplicationTable
    attr_reader :integer_list

    def initialize(integer_list)
      @integer_list = integer_list
    end

    def to_s
      return '' if integer_list.empty?

      if integer_list.size == 1
        "   | 2 \n"\
        "---+---\n"\
        " 2 | 4 \n"
      else
        "    |  2  3  5  7  11 \n"\
        "----+----------------\n"\
        "  2 |  4  6 10 14  22\n"\
        "  3 |  6  9 15 21  33\n"\
        "  5 | 10 15 25 35  55\n"\
        "  7 | 14 21 35 49  77\n"\
        " 11 | 22 33 55 77 121\n"
      end
    end

    def matrix
      integer_list.reduce([]) do |acc, elem|
        acc << integer_list.map { |integer| integer * elem }
      end
    end
  end
end
