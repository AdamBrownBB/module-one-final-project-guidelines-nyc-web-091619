class CreateFridgeItemsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :fridge_items do |t|
      t.integer :user_id
      t.integer :food_id
      t.datetime :date_of_purchase
      t.datetime :expiration
      t.integer :quantity
      t.timestamps
    end
  end
end
