class CreateMealsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :meals_users, id: false do |t|
      t.references :user
      t.references :meal
    end
  end
end
