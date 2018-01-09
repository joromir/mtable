require 'spec_helper'

RSpec.describe MTable::PrimeSequence do
  describe '#to_a' do
    context 'when size is 0' do
      subject(:sequence) { described_class.new(size: 0).to_a }

      it 'returns an empty collection' do
        expect(sequence).to be_empty
      end
    end
  end
end
