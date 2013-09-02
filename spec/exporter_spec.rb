require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Zengin::Exporter do
  let(:client_name)           { 'sengoku38' }
  let(:client_branch_code)    { 5 }
  let(:client_account_number) { 1234567 }
  let(:deposit_at)            { Time.now }

  let(:deposits) do
    [
      {
        bank_code: 33,
        branch_code: 1,
        account_type: Zengin::AccountType.ordinary,
        account_number: 0123456,
        account_name: 'tarou',
        amount: 888,
      },
      {
        bank_code: 5,
        branch_code: 1,
        account_type: Zengin::AccountType.current,
        account_number: 1234567,
        account_name: 'jirou',
        amount: 2525,
      }
    ]
  end

  let(:exporter) do
    Zengin::Exporter.new(
      client_name: client_name,
      client_branch_code: client_branch_code,
      client_account_number: client_account_number,
      deposit_at: deposit_at,
      deposits: deposits,
    )
  end

  describe '#rows' do
    subject { exporter.rows }

    it 'contains 1 header + N(deposits) rows + 2 footers' do
      expect(subject).to have(1 + deposits.length + 2).items
    end
  end
end
