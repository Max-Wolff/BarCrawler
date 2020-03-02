class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.references :group, foreign_key: true
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
