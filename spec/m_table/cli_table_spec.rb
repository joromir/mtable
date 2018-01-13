require 'spec_helper'

RSpec.describe MTable::CliTable do
  describe '#to_s' do
    context 'when the input is an empty array' do
      it 'generates an empty table' do
        matrix = MTable::MultiplicationMatrix.new([])
        expect(described_class.new(matrix).to_s).to eq ''
      end
    end

    context 'when the input is an array of size one' do
      it 'generates a 1x1 table' do
        matrix = MTable::MultiplicationMatrix.new([2])

        table = "   | 2 \n"\
                "---+---\n"\
                " 2 | 4 \n"

        expect(described_class.new(matrix).to_s).to eq table
      end
    end

    context 'when the input is an array of size five' do
      it 'generates a 5x5 table' do
        matrix = MTable::MultiplicationMatrix.new([2, 3, 5, 7, 11])

        table = "     |   2    3    5    7   11 \n"\
                "-----+-------------------------\n"\
                "   2 |   4    6   10   14   22 \n"\
                "   3 |   6    9   15   21   33 \n"\
                "   5 |  10   15   25   35   55 \n"\
                "   7 |  14   21   35   49   77 \n"\
                "  11 |  22   33   55   77  121 \n"

        expect(described_class.new(matrix).to_s).to eq table
      end
    end

    context 'when the input is an array of size ten' do
      it 'generates a 10x10 table' do
        integers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        matrix = MTable::MultiplicationMatrix.new(integers)

        table = "     |   2    3    5    7   11   13   17   19   23   29 \n"\
                "-----+--------------------------------------------------\n"\
                "   2 |   4    6   10   14   22   26   34   38   46   58 \n"\
                "   3 |   6    9   15   21   33   39   51   57   69   87 \n"\
                "   5 |  10   15   25   35   55   65   85   95  115  145 \n"\
                "   7 |  14   21   35   49   77   91  119  133  161  203 \n"\
                "  11 |  22   33   55   77  121  143  187  209  253  319 \n"\
                "  13 |  26   39   65   91  143  169  221  247  299  377 \n"\
                "  17 |  34   51   85  119  187  221  289  323  391  493 \n"\
                "  19 |  38   57   95  133  209  247  323  361  437  551 \n"\
                "  23 |  46   69  115  161  253  299  391  437  529  667 \n"\
                "  29 |  58   87  145  203  319  377  493  551  667  841 \n"

        expect(described_class.new(matrix).to_s).to eq table
      end
    end

    context 'when input is an array with large numbers' do
      it 'generates a well formatted table' do
        matrix = MTable::MultiplicationMatrix.new([3, 4, 5, 6, 7, 8, 9000])

        table =  "          |        3         4         5         6         7         8      9000 \n"\
                 "----------+----------------------------------------------------------------------\n"\
                 "        3 |        9        12        15        18        21        24     27000 \n"\
                 "        4 |       12        16        20        24        28        32     36000 \n"\
                 "        5 |       15        20        25        30        35        40     45000 \n"\
                 "        6 |       18        24        30        36        42        48     54000 \n"\
                 "        7 |       21        28        35        42        49        56     63000 \n"\
                 "        8 |       24        32        40        48        56        64     72000 \n"\
                 "     9000 |    27000     36000     45000     54000     63000     72000  81000000 \n"

        expect(described_class.new(matrix).to_s).to eq table
      end
    end
  end
end
