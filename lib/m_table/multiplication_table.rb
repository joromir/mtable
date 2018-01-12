module MTable
  class MultiplicationTable # :nodoc:
    attr_reader :integer_list, :max, :matrix

    def initialize(integer_list)
      @integer_list = integer_list
      @max          = integer_list.max
      @matrix       = MultiplictionMatrix.new(integer_list).to_a
    end

    def to_s
      matrix.each.with_index.reduce(header) do |acc, (matrix_array, position)|
        "#{acc}#{formated_row(matrix_array, position)}"
      end
    end

    private

    def formated_row(matrix_array, position)
      pointer = integer_list[position]

      "#{align_element(pointer)}|#{align_elements(matrix_array)}\n"
    end

    def align_elements(matrix_array)
      matrix_array.reduce('') { |acc, elem| "#{acc}#{align_element(elem)}" }
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
