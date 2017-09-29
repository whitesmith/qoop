class AddWalletAdressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wallet_address, :string
  end
end
