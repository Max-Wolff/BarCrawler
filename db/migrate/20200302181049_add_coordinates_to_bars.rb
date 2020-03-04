class AddCoordinatesToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :selected, :boolean, default: false
  end
end
