class CreateFridgeItemsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :fridge_items do |t|
      t.integer :user_id
      t.integer :food_id
      t.date :date_of_purchase, :default => Date.current
      t.date :expiration
      t.integer :quantity
      t.timestamps
    end
  end
end
