require 'tty-prompt'


class User < ActiveRecord::Base 
    has_many :fridge_items
    has_many :foods, through: :fridge_items

    def buy_food

        prompt = TTY::Prompt.new
        choices = Food.all.map {|food| food.name}
        results = prompt.select("Cool, #{self.name}, what would you like to buy?", choices)
        food = Food.all.find_by(name: results)
        FridgeItem.create(user_id: self.id, food_id: food.id, expiration: "19-10-31")

        
        
        binding.pry
        # if milk, find <milk> row in the foods table, create current user with milk
        
        
        
    end
    

end #end of class