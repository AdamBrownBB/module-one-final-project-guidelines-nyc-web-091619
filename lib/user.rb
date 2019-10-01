class User < ActiveRecord::Base 
    has_many :fridge_items
    has_many :foods, through: :fridge_items
end