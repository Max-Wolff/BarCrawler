class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :category
      t.string :open_until
      t.string :open_weekly
      t.boolean :open_today
      t.integer :price
      t.float :rating
      t.string :photo_url

      t.timestamps
    end
  end
end
