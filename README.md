### 全銀CSVエクスポーター

全銀の形式のCSVを吐きます。 ネット銀行などを使って振込を自動で行いたい時に使っ
て下さい。

### 使い方

```
# 振込先の配列
deposits = [
  {
    bank_code: 33,
    branch_code: 1,
    account_type: Zengin::AccountType.ordinary,
    account_number: 0123456,
    account_name: 'タロウ',
    amount: 888,
  },
  {
    bank_code: 5,
    branch_code: 1,
    account_type: Zengin::AccountType.current,
    account_number: 1234567,
    account_name: 'ジロウ',
    amount: 2525,
  },
]

# 振込元（自分）の口座などを設定
exporter = Zengin::Exporter.new(
  client_name: 'ハナコ',
  client_branch_code: 1,
  client_account_number: 2345678,
  deposit_at: Time.now,
  deposits: deposits,
)

# CSVとして保存
exporter.export('/tmp/deposits.csv')
```

### 開発

```
% bundle install
% bundle exec rspec
% bundle exec gem build zengin.gemspec
% bundle exec gem install zengin-0.1.0.gem
```
