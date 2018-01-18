require 'spec_helper'

RSpec.describe MTable::FibonacciSequence do
  describe '#to_a' do
    context 'when size is 0' do
      it 'returns an empty array' do
        expect(described_class.new(size: 0).to_a).to be_empty
      end
    end

    context 'when size is 1' do
      it 'returns the first fibonacci number - 1' do
        expect(described_class.new(size: 1).to_a).to contain_exactly 1
      end
    end

    context 'when size is 5' do
      it 'returns an array of fibonacci numbers' do
        sequence = [1, 1, 2, 3, 5]

        expect(described_class.new(size: 5).to_a).to match_array(sequence)
      end
    end
  end

  describe '#each' do
    context 'when no block given' do
      it 'returns an instance of Enumerator' do
        expect(described_class.new(size: 5).each).to be_an_instance_of Enumerator
      end
    end
  end
end
