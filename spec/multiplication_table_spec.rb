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
        table = "     2\n"\
                "---+---\n"\
                " 2 | 4\n"

        expect(described_class.new([2]).to_s).to eq table
      end
    end

    context 'when the input is an array of size five' do
      it 'generates a 5x5 table' do
        table = "        2   3   5   7  11\n"\
                "----+--------------------\n"\
                "  2 |   4   6  10  14  22\n"\
                "  3 |   6   9  15  21  33\n"\
                "  5 |  10  15  25  35  55\n"\
                "  7 |  14  21  35  49  77\n"\
                " 11 |  22  33  55  77 121\n"

        expect(described_class.new([2, 3, 5, 7, 11]).to_s).to eq table
      end
    end

    context 'when the input is an array of size ten' do
      it 'generates a 10x10 table' do
        table = "        2   3   5   7  11  13  17  19  23  29\n"\
                "----+----------------------------------------\n"\
                "  2 |   4   6  10  14  22  26  34  38  46  58\n"\
                "  3 |   6   9  15  21  33  39  51  57  69  87\n"\
                "  5 |  10  15  25  35  55  65  85  95 115 145\n"\
                "  7 |  14  21  35  49  77  91 119 133 161 203\n"\
                " 11 |  22  33  55  77 121 143 187 209 253 319\n"\
                " 13 |  26  39  65  91 143 169 221 247 299 377\n"\
                " 17 |  34  51  85 119 187 221 289 323 391 493\n"\
                " 19 |  38  57  95 133 209 247 323 361 437 551\n"\
                " 23 |  46  69 115 161 253 299 391 437 529 667\n"\
                " 29 |  58  87 145 203 319 377 493 551 667 841\n"

        expect(described_class.new([2, 3, 5, 7, 11, 13, 17, 19, 23, 29]).to_s).to eq table
      end
    end
  end

  describe '#matrix' do
    context 'when the input is an empty array' do
      it 'is empty' do
        expect(described_class.new([]).matrix).to be_empty
      end
    end

    context 'when the input is an array of size one' do
      it 'returns a 1x1 matrix' do
        expect(described_class.new([2]).matrix).to eq [[4]]
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

        expect(described_class.new([2, 3, 5, 7, 11]).matrix).to eq table
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

        expect(described_class.new([2, 2, 2, 2]).matrix).to eq table
      end
    end
  end
end
