class AddLocationToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :location, :string
  end
end
