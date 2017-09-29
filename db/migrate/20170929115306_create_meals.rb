class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table    :meals do |t|
      t.string      :address
      t.string      :title
      t.text        :description
      t.datetime    :date
      t.attachment  :image
      t.references  :owner_id
      t.integer     :max_people
      t.string      :place
      t.text        :tags

      t.timestamps
    end
  end
end
