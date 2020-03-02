class DrinkStop < ApplicationRecord
  belongs_to :drink
  belongs_to :stop
end
