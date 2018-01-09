require 'spec_helper'

RSpec.describe MTable::PrimeSequence do
  describe '#to_a' do
    subject(:sequence) { described_class.new(size: size) }

    context 'when size is 0' do
      let(:size) { 0 }

      it 'returns an empty collection' do
        expect(sequence.to_a).to be_empty
      end
    end

    context 'when size is 1' do
      let(:size) { 1 }

      it 'returns a list with prime numbers' do
        expect(sequence.to_a).to contain_exactly(2)
      end
    end

    context 'when size is 10' do
      let(:size) { 10 }

      it 'returns a list with prime numbers' do
        expected_list = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

        expect(sequence.to_a).to contain_exactly(*expected_list)
      end
    end
  end
end
