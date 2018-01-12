module MTable
  class MultiplicationTable # :nodoc:
    attr_reader :integer_list, :max

    def initialize(integer_list)
      @integer_list = integer_list
      @max          = integer_list.max
    end

    def to_s
      return '' if integer_list.empty?

      head = "#{header}\n#{separator}\n"

      matrix.each.with_index.reduce(head) do |acc, (elem, position)|
        item = beautify(integer_list[position])

        "#{acc}#{item} |#{align_elements(elem)}\n"
      end
    end

    def matrix
      integer_list.reduce([]) { |acc, elem| acc << matrix_row(elem) }
    end

    private

    def matrix_row(elem)
      integer_list.map { |integer| integer * elem }
    end

    def beautify(number)
      ' ' * (offset - number.to_s.size) + number.to_s
    end

    def header
      ' ' * (offset + 2) + "#{align_elements(integer_list)}"
    end

    def separator
      "#{number_space}+#{number_space * integer_list.size}"
    end

    def number_space
      '-' * (max.to_s.size + 2)
    end

    def align_elements(column)
      column.reduce('') { |acc, elem| "#{acc} #{beautify(elem)}" }
    end

    def offset
      @offset ||= (max * max).to_s.size
    end
  end
end
