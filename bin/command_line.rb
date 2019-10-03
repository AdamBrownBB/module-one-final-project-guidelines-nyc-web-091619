require 'tty-prompt'
  
    current_user = nil 

    def greeting
        sleep 3
        prompt = TTY::Prompt.new
        name = prompt.ask("Hello! What is your name?")
        current_user = User.create(name: "#{name}")
        show_main_menu (current_user)
    end

    def show_main_menu(current_user)
        prompt = TTY::Prompt.new
        choices = ["Buy food", "Check whole fridge", "Check food quantity", "Clean fridge", "Move out", "Exit"]
        results = prompt.select("Hi #{current_user.name}, what would you like to do?", choices)
        
        if results == "Buy food"
            current_user.buy_food
        elsif results == "Check whole fridge"
            current_user.check_fridge
        elsif results == "Check food quantity"
            current_user.check_food_quantity
        elsif results == "Clean fridge"
            current_user.clean_fridge
        elsif results == "Move out"
            current_user.delete_user_account
        elsif results == "Exit"
            exit 
        end
    end











