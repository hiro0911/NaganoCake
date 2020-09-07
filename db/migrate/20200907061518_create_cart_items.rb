class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :count
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
