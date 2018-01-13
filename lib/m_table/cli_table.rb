module MTable
  # Responsible for the generation of a string representation
  # for a given multiplication matrix.
  class CliTable # :nodoc:
    attr_reader :integer_list, :max, :matrix

    def initialize(integer_list)
      @integer_list = integer_list
      @max          = integer_list.max
      @matrix       = MultiplictionMatrix.new(integer_list).to_a
    end

    def to_s
      matrix.zip(integer_list).reduce(header) do |acc, (matrix_array, pointer)|
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
      (max * max).to_s.size
    end

    def separator
      cell_filler = '-' * (max_element_size + 2)

      "#{cell_filler}+#{cell_filler * integer_list.size}"
    end

    def header
      return '' if integer_list.empty?

      "#{align_element(' ')}|#{align_elements(integer_list)}\n#{separator}\n"
    end
  end
end
