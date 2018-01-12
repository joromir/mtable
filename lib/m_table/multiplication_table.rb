module MTable
  class MultiplicationTable # :nodoc:
    attr_reader :integer_list, :max, :matrix

    def initialize(integer_list)
      @integer_list = integer_list
      @max          = integer_list.max
      @matrix       = MultiplictionMatrix.new(integer_list).to_a
    end

    def to_s
      return '' if integer_list.empty?

      head = "#{header}\n#{separator}\n"

      matrix.each.with_index.reduce(head) do |acc, (elem, position)|
        item = beautify(integer_list[position])

        "#{acc}#{item} |#{align_elements(elem)}\n"
      end
    end

    private

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
