class Food < ActiveRecord::Base 
    has_many :fridge_items
    has_many :users, through: :fridge_items
end