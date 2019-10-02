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
        # show_main_menu(self)
        binding.pry
        
    end

    def my_fridge_items   #helper method to find current user's fridge items
        FridgeItem.all.select do |item|
            item.user_id == self.id
        end
    end

    def check_fridge
        my_fridge_items.each.with_index(1) do |item, i| 
            puts "#{i}. #{item.food.name}"
            puts "Bought on: #{item.date_of_purchase}"
        end

    end
    

end #end of class