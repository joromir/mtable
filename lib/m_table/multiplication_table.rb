module MTable
  class MultiplicationTable # :nodoc:
    attr_reader :integer_list, :max, :columns

    def initialize(integer_list)
      @integer_list = integer_list
      @max          = integer_list.max
      @columns      = MultiplictionMatrix.new(integer_list).to_a
    end

    def to_s
      columns.each.with_index.reduce(header) do |acc, (elem, position)|
        "#{acc}#{table_row(elem, position)}"
      end
    end

    private

    def table_row(matrix_row, position)
      pointer = integer_list[position]

      "#{align_element(pointer)}|#{align_elements(matrix_row)}\n"
    end

    def align_elements(column_array)
      column_array.reduce('') { |acc, elem| "#{acc}#{align_element(elem)}" }
    end

    def align_element(item)
      ' ' * (max_element_size - item.to_s.size) + " #{item} "
    end

    def cell_size
      max_element_size + 2
    end

    def max_element_size
      (max * max).to_s.size
    end

    def separator
      body_separator = cell_filler * integer_list.size

      "#{cell_filler}+#{body_separator}"
    end

    def header
      return '' if integer_list.empty?

      "#{cell_filler(' ')}|#{align_elements(integer_list)}\n#{separator}\n"
    end

    def cell_filler(char = '-')
      char * cell_size
    end
  end
end
