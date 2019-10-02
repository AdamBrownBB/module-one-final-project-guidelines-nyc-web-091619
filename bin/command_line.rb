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
        choices = ["Buy food", "Check fridge", "Clean Fridge", "Exit"]
        results = prompt.select("Hi #{current_user.name}, what would you like to do?", choices)

        if results == "Buy food"
            current_user.buy_food
        elsif results == "Check fridge"
            check_fridge
        elsif results == "Clean fridge"
            clean_fridge
        else
            exit_program
        end

    end









# binding.pry 