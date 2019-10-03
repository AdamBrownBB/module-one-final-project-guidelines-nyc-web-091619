require 'tty-prompt'
  
    current_user = nil 

    def greeting
        prompt = TTY::Prompt.new
        puts "Hello! Welcome to your refrigerator."
        name = prompt.ask("What is your name?")
        current_user = User.create(name: "#{name}")
        show_main_menu (current_user)
    end

    def show_main_menu(current_user)
        prompt = TTY::Prompt.new
        choices = ["Buy food", "Check fridge", "Clean fridge", "Move out", "Exit"]
        results = prompt.select("Hi #{current_user.name}, what would you like to do?", choices)
        
        if results == "Buy food"
            current_user.buy_food
        elsif results == "Check fridge"
            current_user.check_fridge
        elsif results == "Clean fridge"
            current_user.clean_fridge
        elsif results == "Move out"
            current_user.delete_user_account
        else
            exit 
        end
    end

    def exit
        prompt = TTY::Prompt.new(interrupt: :signal)
    end









