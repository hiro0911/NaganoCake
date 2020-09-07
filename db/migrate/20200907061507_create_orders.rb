class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :postage
      t.integer :billing_amount
      t.integer :payment
      t.integer :order_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
