require 'spec_helper'

RSpec.describe MTable::MultiplicationMatrix do
  describe '#to_a' do
    context 'when the input is an empty array' do
      it 'is empty' do
        expect(described_class.new([]).to_a).to be_empty
      end
    end

    context 'when the input is an array of size one' do
      it 'returns a 1x1 matrix' do
        expect(described_class.new([2]).to_a).to eq [[4]]
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

        expect(described_class.new([2, 3, 5, 7, 11]).to_a).to eq table
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

        expect(described_class.new([2, 2, 2, 2]).to_a).to eq table
      end
    end
  end

  describe '#max' do
    context 'when collection is empty' do
      it 'returns nil' do
        expect(described_class.new([]).max).to be_nil
      end
    end

    context 'when collection is NOT empty' do
      it 'returns the max of the list on the power of two' do
        expect(described_class.new([2, 4]).max).to eq 16
      end
    end
  end
end
