require 'spec_helper'

RSpec.describe MTable::MultiplicationTable do
  describe '#to_s' do
    context 'when the input is an empty array' do
      it 'generates an empty table' do
        expect(described_class.new([]).to_s).to eq ''
      end
    end

    context 'when the input is an array of size one' do
      it 'generates a 1x1 table' do
        table = "   | 2 \n"\
                "---+---\n"\
                " 2 | 4 \n"

        expect(described_class.new([2]).to_s).to eq table
      end
    end

    context 'when the input is an array of size five' do
      it 'generates a 5x5 table' do
        table = "     |   2    3    5    7   11 \n"\
                "-----+-------------------------\n"\
                "   2 |   4    6   10   14   22 \n"\
                "   3 |   6    9   15   21   33 \n"\
                "   5 |  10   15   25   35   55 \n"\
                "   7 |  14   21   35   49   77 \n"\
                "  11 |  22   33   55   77  121 \n"

        expect(described_class.new([2, 3, 5, 7, 11]).to_s).to eq table
      end
    end

    context 'when the input is an array of size ten' do
      it 'generates a 10x10 table' do
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

        expect(described_class.new([2, 3, 5, 7, 11, 13, 17, 19, 23, 29]).to_s).to eq table
      end
    end

    context 'when input is an array with large numbers' do
      it 'generates a well formatted table' do
        table =  "          |        3         4         5         6         7         8      9000 \n"\
                 "----------+----------------------------------------------------------------------\n"\
                 "        3 |        9        12        15        18        21        24     27000 \n"\
                 "        4 |       12        16        20        24        28        32     36000 \n"\
                 "        5 |       15        20        25        30        35        40     45000 \n"\
                 "        6 |       18        24        30        36        42        48     54000 \n"\
                 "        7 |       21        28        35        42        49        56     63000 \n"\
                 "        8 |       24        32        40        48        56        64     72000 \n"\
                 "     9000 |    27000     36000     45000     54000     63000     72000  81000000 \n"

        expect(described_class.new([3, 4, 5, 6, 7, 8, 9000]).to_s).to eq table
      end
    end
  end

  describe '#columns' do
    context 'when the input is an empty array' do
      it 'is empty' do
        expect(described_class.new([]).columns).to be_empty
      end
    end

    context 'when the input is an array of size one' do
      it 'returns a 1x1 matrix' do
        expect(described_class.new([2]).columns).to eq [[4]]
      end
    end

    context 'when the input is an array if size five' do
      it 'returns a 5x5 matrix' do
        table = [
          [4, 6, 10, 14, 22],
          [6, 9, 15, 21, 33],
          [10, 15, 25, 35, 55],
          [14, 21, 35, 49, 77],
          [22, 33, 55, 77, 121]
        ]

        expect(described_class.new([2, 3, 5, 7, 11]).columns).to eq table
      end
    end

    context 'when the input is an array of size 4' do
      it 'returns a 4x4 matrix' do
        table = [
          [4, 4, 4, 4],
          [4, 4, 4, 4],
          [4, 4, 4, 4],
          [4, 4, 4, 4]
        ]

        expect(described_class.new([2, 2, 2, 2]).columns).to eq table
      end
    end
  end
end
