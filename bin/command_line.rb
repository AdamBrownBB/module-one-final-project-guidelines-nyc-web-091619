require 'tty-prompt'
  
    current_user = nil 

    def greeting

#     puts "

# ____    __    ____  _______  __        ______   ______   .___  ___.  _______    .___________.  ______      ____    ____  ______    __    __  .______         
# \   \  /  \  /   / |   ____||  |      /      | /  __  \  |   \/   | |   ____|   |           | /  __  \     \   \  /   / /  __  \  |  |  |  | |   _  \        
#  \   \/    \/   /  |  |__   |  |     |  ,----'|  |  |  | |  \  /  | |  |__      `---|  |----`|  |  |  |     \   \/   / |  |  |  | |  |  |  | |  |_)  |       
#   \            /   |   __|  |  |     |  |     |  |  |  | |  |\/|  | |   __|         |  |     |  |  |  |      \_    _/  |  |  |  | |  |  |  | |      /        
#    \    /\    /    |  |____ |  `----.|  `----.|  `--'  | |  |  |  | |  |____        |  |     |  `--'  |        |  |    |  `--'  | |  `--'  | |  |\  \----.   
#     \__/  \__/     |_______||_______| \______| \______/  |__|  |__| |_______|       |__|      \______/         |__|     \______/   \______/  | _| `._____|   
                                                                                                                                                             
#             .______       _______  _______ .______       __    _______  _______ .______          ___   .___________.  ______   .______                       
#             |   _  \     |   ____||   ____||   _  \     |  |  /  _____||   ____||   _  \        /   \  |           | /  __  \  |   _  \                      
#             |  |_)  |    |  |__   |  |__   |  |_)  |    |  | |  |  __  |  |__   |  |_)  |      /  ^  \ `---|  |----`|  |  |  | |  |_)  |                     
#             |      /     |   __|  |   __|  |      /     |  | |  | |_ | |   __|  |      /      /  /_\  \    |  |     |  |  |  | |      /                      
#             |  |\  \----.|  |____ |  |     |  |\  \----.|  | |  |__| | |  |____ |  |\  \----./  _____  \   |  |     |  `--'  | |  |\  \----.                 
#             | _| `._____||_______||__|     | _| `._____||__|  \______| |_______|| _| `._____/__/     \__\  |__|      \______/  | _| `._____|                 
                                                                                                                                                             

#     "               
                                                                                                                                     



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
        elsif results == "Exit"
            exit 
        end
    end











