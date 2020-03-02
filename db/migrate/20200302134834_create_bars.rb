class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.float :rating
      t.string :address
      t.string :price
      t.string :picture_url
      t.string :category

      t.timestamps
    end
  end
end
