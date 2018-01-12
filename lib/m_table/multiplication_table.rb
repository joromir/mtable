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
        "#{acc}#{table_column(elem, position)}"
      end
    end

    private

    def table_column(element, position)
      pointer = integer_list[position]

      "#{align_element(pointer)}|#{align_elements(element)}\n"
    end

    def align_elements(column_array)
      column_array.reduce('') { |acc, elem| "#{acc}#{align_element(elem)}" }
    end

    def cell_size(offset: 1)
      (max * max).to_s.size + offset
    end

    def separator_line
      "#{cell_filler}+#{cell_filler * integer_list.size}"
    end

    def header
      return '' if integer_list.empty?

      "#{cell_filler(' ')}|#{align_elements(integer_list)}\n#{separator_line}\n"
    end

    def cell_filler(char = '-')
      char * cell_size(offset: 2)
    end

    def align_element(item)
      ' ' * (cell_size - item.to_s.size) + "#{item} "
    end
  end
end
