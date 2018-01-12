module MTable
  class MultiplicationTable # :nodoc:
    attr_reader :integer_list, :max, :columns

    def initialize(integer_list)
      @integer_list = integer_list
      @max          = integer_list.max
      @columns      = MultiplictionMatrix.new(integer_list).to_a
    end

    def to_s
      return '' if integer_list.empty?

      columns.each.with_index.reduce(header) do |acc, (elem, position)|
        item = align_element(integer_list[position])

        "#{acc}#{item} |#{align_elements(elem)}\n"
      end
    end

    private

    def header
      "#{placeholder(' ')} #{align_elements(integer_list)}\n#{separator}\n"
    end

    def placeholder(splitter = '-')
      splitter * (max.to_s.size + 2)
    end

    def separator
      "#{placeholder}+#{placeholder * integer_list.size}"
    end

    def align_elements(column)
      column.reduce('') { |acc, elem| "#{acc} #{align_element(elem)}" }
    end

    def align_element(number)
      return " #{integer_list.last}" if integer_list.size == 1

      ' ' * (offset - number.to_s.size) + number.to_s
    end

    def offset
      @offset ||= (max * max).to_s.size
    end
  end
end
