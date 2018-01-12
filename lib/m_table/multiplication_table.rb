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
        item = align_element(integer_list[position])

        "#{acc}#{item} |#{align_elements(elem)}\n"
      end
    end

    private

    def header
      return '' if integer_list.empty?

      "#{cell_filler(' ')}|#{align_elements(integer_list)}\n#{separator_line}\n"
    end

    def cell_filler(char = '-')
      char * (max.to_s.size + 2)
    end

    def separator_line
      "#{cell_filler}+#{cell_filler * integer_list.size}"
    end

    def align_elements(column)
      column.reduce('') { |acc, elem| "#{acc} #{align_element(elem)}" }
    end

    def align_element(item)
      return " #{item}" if integer_list.size == 1

      ' ' * ((max * max).to_s.size - item.to_s.size) + item.to_s
    end
  end
end
