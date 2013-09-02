module Zengin
  class Exporter
    attr_accessor :client_name, :client_branch_code, :client_account_number, :deposit_at, :deposits

    def initialize(options = {})
      options = default_options.merge!(options)

      self.client_name           = options[:client_name]
      self.client_branch_code    = options[:client_branch_code]
      self.client_account_number = options[:client_account_number]
      self.deposit_at            = options[:deposit_at]
      self.deposits              = options[:deposits]
    end

    def rows
      deposits.reduce([build_header]) do |accumulator, deposit|
        accumulator << build_row(deposit)
      end + build_footer
    end

    def export(path)
      CSV.open(path, 'wb', encoding: 'Shift_JIS') do |csv|
        rows.each do |row|
          csv << row
        end
      end
    end

    private

    def build_header
      Zengin::HeaderFormatter.new(
        client_name: client_name,
        client_branch_code: client_branch_code,
        client_account_number: client_account_number,
        deposit_at: deposit_at,
      ).format
    end

    def build_footer
      Zengin::FooterFormatter.new(deposits).format
    end

    def build_row(deposit)
      Zengin::RowFormatter.new(deposit).format
    end

    def default_options
      default_options = {
        deposit_at: Time.now,
        deposits: [],
      }
    end
  end
end
