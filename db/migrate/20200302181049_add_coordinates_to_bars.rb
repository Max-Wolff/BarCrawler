class AddCoordinatesToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :latitude, :float
    add_column :bars, :longitude, :float
    add_column :bars, :open_until, :string
    add_column :bars, :open_weekly, :string
    add_column :bars, :open_today, :boolean
    add_column :bars, :url, :string
  end
end
