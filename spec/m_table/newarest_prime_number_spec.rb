require 'spec_helper'

RSpec.describe MTable::NearestPrimeNumber do
  describe '#to_i' do
    context 'when input_integer is a prime number' do
      it 'returns the input integer' do
        expect(described_class.new(2).to_i).to eq 2
      end
    end

    context 'when input_integer is not a prime number' do
      it 'returns the closest consecutive prime number' do
        expect(described_class.new(25).to_i).to eq 29
      end
    end
  end
end
