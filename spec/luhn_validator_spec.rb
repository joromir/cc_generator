require 'spec_helper'

RSpec.describe LuhnValidator do # rubocop:disable Metrics/BlockLength
  describe '#valid?' do
    subject { described_class.new(account_number) }

    context 'when valid bogus cc number is "4111111111111111"' do
      let(:account_number) { '4111111111111111' }

      it 'evaluates to true' do
        expect(subject).to be_valid
      end
    end

    context 'when invalid bogus cc number is "4111111111111116"' do
      let(:account_number) { '4111111111111116' }

      it 'evaluates to false' do
        expect(subject).to_not be_valid
      end
    end

    context 'when valid bogus cc number is "79927398713"' do
      let(:account_number) { '79927398713' }

      it 'evaluates to true' do
        expect(subject).to be_valid
      end
    end

    context 'when valid bogus cc number is "4200000000000000"' do
      let(:account_number) { '4200000000000000' }

      it 'evaluates to true' do
        expect(subject).to be_valid
      end
    end

    context 'when invalid bogus cc number is "79927398714"' do
      let(:account_number) { '79927398714' }

      it 'evaluates to false' do
        expect(subject).to_not be_valid
      end
    end
  end
end
