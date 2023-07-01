class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :payment, null: false, default: 1
      t.integer :item_total, null: false
      t.integer :postage, null: false
      t.timestamps
    end
  end
end
