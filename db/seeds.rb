u1 = User.create(name: "Adam")
u2 = User.create(name: "Connor")
u3 = User.create(name: "Jinming")

f1 = Food.create(name: "milk")
f2 = Food.create(name: "egg")
f3 = Food.create(name: "steak")

# item1 = FridgeItem.create(user_id: u1.id, food_id: f1.id, date_of_purchase: 10/01/19, expiration: 10/15/19, quantity: 2)
# item2 = FridgeItem.create(user_id: u2.id, food_id: f2.id, date_of_purchase: 9/28/19, expiration: 10/15/19, quantity: 2)
# item3 = FridgeItem.create(user_id: u3.id, food_id: f3.id, date_of_purchase: 9/20/19, expiration: 10/15/19, quantity: 1)

#       eger :user_id
#       t.integer :food_id
#       t.datetime :date_of_purchase
#       t.datetime :expiration
#       t.integer :quantity
#       t.timestamps

