class AddChainAddressToMeal < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :chain_address, :string
  end
end
