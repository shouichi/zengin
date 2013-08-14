module Zengin
  class Deposit
    attr_accessor :bank_code, :branch_code :account_type, :account_number, :account_name, :amount

    def initialize(options = {})
      bank_code      = options[:bank_code]
      branch_code    = options[:branch_code]
      account_type   = options[:account_type]
      account_number = options[:account_number]
      account_name   = options[:account_name]
      amount         = options[:amount]
    end
  end
end
