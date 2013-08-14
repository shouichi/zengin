module Zengin
  class HeaderFormatter
    attr_accessor :client_name, :client_branch_code, :client_account_number, :deposit_at

    def initialize(options = {})
      self.client_name           = options[:client_name]
      self.client_branch_code    = options[:client_branch_code]
      self.client_account_number = options[:client_account_number]
      self.deposit_at            = options[:deposit_at]
    end

    def format
      [1, 21, 0, nil, client_name, formatted_deposit_at, 33, nil, client_branch_code, nil, 1, client_account_number]
    end

    private

    def formatted_deposit_at
      '%02d%02d' % [deposit_at.month, deposit_at.day]
    end
  end

  class RowFormatter
    attr_accessor :deposit

    def initialize(deposit)
      self.deposit = deposit
    end

    def format
      [2, deposit[:bank_code], nil, deposit[:branch_code], nil, nil, deposit[:account_type], deposit[:account_number], deposit[:account_name], deposit[:amount], 0, nil]
    end
  end
end
