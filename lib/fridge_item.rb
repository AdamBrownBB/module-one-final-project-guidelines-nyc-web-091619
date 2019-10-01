class FridgeItem < ActiveRecord::Base 
    belongs_to :users
    belongs_to :foods
end