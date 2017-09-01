class AccountNumber < ActiveRecord::Migration[5.1]
  def change
    create_table :account_numbers do |t|
      t.column :pan, :string
    end
  end
end
