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
        table = "    |  2  3  5  7  11 \n"\
                "----+----------------\n"\
                "  2 |  4  6 10 14  22\n"\
                "  3 |  6  9 15 21  33\n"\
                "  5 | 10 15 25 35  55\n"\
                "  7 | 14 21 35 49  77\n"\
                " 11 | 22 33 55 77 121\n"

        expect(described_class.new([2, 3, 5, 7, 11]).to_s).to eq table
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
  end
end
