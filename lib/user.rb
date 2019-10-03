require 'tty-prompt'


class User < ActiveRecord::Base 
    has_many :fridge_items
    has_many :foods, through: :fridge_items

    def buy_food

        prompt = TTY::Prompt.new
        choices = Food.all.map {|food| food.name}
        results = prompt.select("Cool, #{self.name}, what would you like to buy?", choices)
        food = Food.all.find_by(name: results)
        FridgeItem.create(user_id: self.id, food_id: food.id, expiration: "2019-10-31")
        show_main_menu(self)
       
        
    end

    def my_fridge_items   #helper method to find current user's fridge items
        FridgeItem.all.select do |item|
            item.user_id == self.id
        end
    end

    def check_fridge
        prompt = TTY::Prompt.new
        choices = my_fridge_items.map { |item|   item.food.name + ": expires on #{item.expiration}" }.push("Nope")
        result = prompt.select("Cool, #{self.name}, do you want to get rid of any of these things?", choices)
        
        if result == "Nope"
            show_main_menu(self)
        else
            my_food_name = result.split(":").first
            item_to_delete = my_fridge_items.find do |item|
                item.food.name == my_food_name
            end
            FridgeItem.delete(item_to_delete.id)
        end
    end
    

end #end of class