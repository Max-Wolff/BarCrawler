class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.references :group, foreign_key: true
      t.references :bar, foreign_key: true
      t.integer :rank

      t.timestamps
    end
  end
end
