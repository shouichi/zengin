require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Zengin::HeaderFormatter do
  let(:client_name)           { 'sengoku38' }
  let(:client_branch_code)    { 5 }
  let(:client_account_number) { 1234567 }
  let(:deposit_at)            { Time.now }

  let(:formatter) do
    Zengin::HeaderFormatter.new(
      client_name: client_name,
      client_branch_code: client_branch_code,
      client_account_number: client_account_number,
      deposit_at: deposit_at,
    )
  end

  describe '#format' do
    subject { formatter.format }

    it 'contains 12 elements' do
      expect(subject).to have(12).items
    end

    it 'has 1 at 0' do
      expect(subject[0]).to eq(1)
    end

    it 'has 21 at 1' do
      expect(subject[1]).to eq(21)
    end

    it 'has 0 at 2' do
      expect(subject[2]).to eq(0)
    end

    it 'has nil at 3' do
      expect(subject[3]).to be_nil
    end

    it 'has client_name at 4' do
      expect(subject[4]).to eq(client_name)
    end

    it 'has MMDD formatted deposit_at at 5' do
      expect(subject[5]).to eq('%02d%02d' % [deposit_at.month, deposit_at.day])
    end

    it 'has 33 at 6' do
      expect(subject[6]).to eq(33)
    end

    it 'has nil at 7' do
      expect(subject[7]).to be_nil
    end

    it 'has branch_code at 8' do
      expect(subject[8]).to eq(client_branch_code)
    end

    it 'has nil at 9' do
      expect(subject[9]).to be_nil
    end

    it 'has 1 at 10' do
      expect(subject[10]).to eq(1)
    end

    it 'has client_account_number at 12' do
      expect(subject[11]).to eq(client_account_number)
    end
  end
end

describe Zengin::RowFormatter do
  let(:bank_code)      { 33 }
  let(:branch_code)    { 1 }
  let(:account_type)   { Zengin::AccountType.ordinary }
  let(:account_number) { 0123456 }
  let(:account_name)   { 'sengoku38' }
  let(:amount)         { 888 }

  let(:formatter) do
    Zengin::RowFormatter.new(
      bank_code: bank_code,
      branch_code: branch_code,
      account_type: account_type,
      account_number: account_number,
      account_name: account_name,
      amount: amount,
    )
  end

  describe '#format' do
    subject { formatter.format }

    it 'has 2 at 0' do
      expect(subject[0]).to eq(2)
    end

    it 'has bank_code at 1' do
      expect(subject[1]).to eq(bank_code)
    end

    it 'has nil at 2' do
      expect(subject[2]).to be_nil
    end

    it 'has branch_code at 3' do
      expect(subject[3]).to eq(branch_code)
    end

    it 'has nil at 4' do
      expect(subject[4]).to be_nil
    end

    it 'has nil at 5' do
      expect(subject[5]).to be_nil
    end

    it 'has account_type at 6' do
      expect(subject[6]).to eq(account_type)
    end

    it 'has account_number at 7' do
      expect(subject[7]).to eq(account_number)
    end

    it 'has account_name at 8' do
      expect(subject[8]).to eq(account_name)
    end

    it 'has amount at 9' do
      expect(subject[9]).to eq(amount)
    end

    it 'has 0 at 10' do
      expect(subject[10]).to eq(0)
    end

    it 'has nil at 11' do
      expect(subject[11]).to be_nil
    end
  end
end
