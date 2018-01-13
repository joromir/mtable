module MTable
  class MultiplicationMatrix # :nodoc:
    attr_reader :integer_list

    def initialize(integer_list)
      @integer_list = integer_list
    end

    def to_a
      integer_list.reduce([]) { |acc, elem| acc << row(elem) }
    end

    def max
      return if integer_list.empty?

      integer_list.max * integer_list.max
    end

    def rows_with_pointers
      integer_list.zip(to_a)
    end

    private

    def row(item)
      integer_list.map { |integer| integer * item }
    end
  end
end
