module MTable
  # Responsible for the generation of a string representation
  # for a given multiplication matrix.
  class CliTable # :nodoc:
    attr_reader :matrix, :max_element_size

    def initialize(symmetrical_matrix)
      @matrix           = symmetrical_matrix
      @max_element_size = matrix.max.to_s.size
    end

    def to_s
      matrix.rows_with_pointers.reduce(header) do |acc, (pointer, matrix_array)|
        "#{acc}#{table_line(pointer: pointer, list: matrix_array)}"
      end
    end

    private

    def align_elements(matrix_array)
      matrix_array.reduce('') { |acc, elem| "#{acc}#{align_element(elem)}" }
    end

    def align_element(item)
      ' ' * (max_element_size - item.to_s.size) + " #{item} "
    end

    def separator
      cell_filler = '-' * (max_element_size + 2)

      "#{cell_filler}+#{cell_filler * matrix.integer_list.size}"
    end

    def header
      return '' if matrix.empty?

      "#{table_line(pointer: ' ', list: matrix.integer_list)}#{separator}\n"
    end

    def table_line(pointer:, list:)
      "#{align_element(pointer)}|#{align_elements(list)}\n"
    end
  end
end
