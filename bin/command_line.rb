require 'tty-prompt'

prompt = TTY::Prompt.new

puts "Hello! Welcome to your refrigerator."



name = prompt.ask("What is your name?")
User.create(name: "#{name}")

choices = ["Buy food", "Check fridge", "Clean Fridge", "Exit"]
prompt.select("Hi #{name}, what would you like to do?", choices)