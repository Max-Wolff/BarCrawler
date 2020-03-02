class CreateDrinkStops < ActiveRecord::Migration[5.2]
  def change
    create_table :drink_stops do |t|
      t.references :drink, foreign_key: true
      t.references :stop, foreign_key: true

      t.timestamps
    end
  end
end
