require 'tty-prompt'


class User < ActiveRecord::Base 
    has_many :fridge_items
    has_many :foods, through: :fridge_items

    def buy_food

        prompt = TTY::Prompt.new
        choices = Food.all.map {|food| food.name}
        results = prompt.select("Cool, #{self.name}, what would you like to buy?", choices)
        food = Food.all.find_by(name: results)

        newest_item = FridgeItem.create(user_id: self.id, food_id: food.id, expiration: "2019-10-31")

        change_exp_prompt = TTY::Prompt.new
        result = change_exp_prompt.yes?("This expires on #{newest_item.expiration}. Would you like to change it?")

        if result
            update_expiration_date(newest_item)
            puts "Ok, the expiration date is now #{newest_item.expiration}."
            sleep 2
            show_main_menu(self)
        elsif
            #let's add a message here
            show_main_menu(self)
        end
        show_main_menu(self)
     
    end

    def update_expiration_date(newest_item)
        prompt = TTY::Prompt.new
        # prompt ask for new date
        new_exp_date = prompt.ask("What is the correct expiration date?")
        newest_item.update(expiration: new_exp_date)
    end

    def my_fridge_items   #helper method to find current user's fridge items
        FridgeItem.all.select do |item|
            item.user_id == self.id
        end
    end

    def check_fridge
        if my_fridge_items.empty?
            puts "Sorry #{self.name}, you have no food. :("
            sleep 3
            show_main_menu(self)
        else
            prompt = TTY::Prompt.new
            choices = my_fridge_items.map { |item|   item.food.name + ": expires on #{item.expiration}" }.push("Nope")
            result = prompt.select("Cool, #{self.name}, do you want to get rid of any of these things?", choices)
            
            if result == "Nope"
                puts "Ok, your fridge remains unchanged"
                sleep 3
                show_main_menu(self)
                
            else
                my_food_name = result.split(":").first
                item_to_delete = my_fridge_items.find do |item|
                item.food.name == my_food_name
                end
                FridgeItem.delete(item_to_delete.id)
                `afplay ./lib/zapsplat_foley_rubbish_push_down_in_small_bin_27372.mp3`
                show_main_menu(self)
            end
        end
    end #end of check_fridge method

    def check_food_quantity
        #pulls all of my_fridge_items.food.name 
        #use unique method to remove dupes
        #present results as array of unique strings, pass to prompt.select
        #they choose one, we look up items w/ same name (find by name).count
        #print return value 
        if my_fridge_items.empty?
        puts "Sorry #{self.name}, you have no food. :("
            sleep 3
            show_main_menu(self)
        else
        prompt = TTY::Prompt.new
        my_unique_items = (my_fridge_items.map { |item| item.food.name}).uniq
        item_selection = prompt.select("What would you like to check?", my_unique_items)
        number = (my_fridge_items.select { |item| item.food.name == item_selection }).count 
        puts "You have #{number} #{item_selection.pluralize}."
        sleep 3
        show_main_menu(self)
        end 
    end

    def clean_fridge
        prompt = TTY::Prompt.new
        result = prompt.yes?("Do you want to clean all of your stuff out of the fridge?")

        if result
            #find all of this users items
            FridgeItem.delete(my_fridge_items)
            `afplay ./lib/zapsplat_foley_rubbish_push_down_in_small_bin_27372.mp3`
            puts "Ok, your fridge is empty!"
            sleep 3
            show_main_menu(self)
            
        else
            puts "Ok, all of your stuff is still in the fridge."
            sleep 3
            show_main_menu(self)
        end
    end

    def delete_user_account
        puts "Ok, bye #{self.name}!"
        # binding.pry
        puts bye_felicia
        FridgeItem.delete(my_fridge_items)
        User.delete(self.id)
        
        greeting
    end

    



    

end #end of class