require 'spec_helper'

RSpec.describe MTable::IntegerHelpers do
  subject(:helper) do
    Class.new do
      include MTable::IntegerHelpers
    end
  end

  describe '#prime?' do
    context 'when the given integer is prime' do
      it 'evaluates to true' do
        expect(helper.new.prime?(5)).to be_truthy
      end
    end

    context 'when the given integer is NOT prime' do
      it 'evaluates to false' do
        expect(helper.new.prime?(12)).to be_falsey
      end
    end
  end
end
