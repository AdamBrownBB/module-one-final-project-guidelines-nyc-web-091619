require 'tty-prompt'
        


    def greeting
        prompt = TTY::Prompt.new
        puts "Hello! Welcome to your refrigerator."
        name = prompt.ask("What is your name?")
        current_user = User.create(name: "#{name}")
        show_main_menu(current_user)
    end

    def show_main_menu(current_user)
        prompt = TTY::Prompt.new
        choices = ["Buy food", "Check fridge", "Clean Fridge", "Exit"]
        results = prompt.select("Hi #{current_user.name}, what would you like to do?", choices)
    end



# if results == 



# binding.pry 