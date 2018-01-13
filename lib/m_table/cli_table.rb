module MTable
  # Responsible for the generation of a string representation
  # for a given multiplication matrix.
  class CliTable # :nodoc:
    attr_reader :matrix

    def initialize(symmetrical_matrix)
      @matrix = symmetrical_matrix
    end

    def to_s
      matrix.rows_with_pointers.reduce(header) do |acc, (pointer, matrix_array)|
        "#{acc}#{align_element(pointer)}|#{align_elements(matrix_array)}\n"
      end
    end

    private

    def align_elements(matrix_array)
      matrix_array.reduce('') { |acc, elem| "#{acc}#{align_element(elem)}" }
    end

    def align_element(item)
      ' ' * (max_element_size - item.to_s.size) + " #{item} "
    end

    def max_element_size
      matrix.max.to_s.size
    end

    def separator
      cell_filler = '-' * (max_element_size + 2)

      "#{cell_filler}+#{cell_filler * matrix.integer_list.size}"
    end

    def header
      return '' if matrix.integer_list.empty?

      "#{align_element(' ')}|#{align_elements(matrix.integer_list)}\n#{separator}\n"
    end
  end
end
