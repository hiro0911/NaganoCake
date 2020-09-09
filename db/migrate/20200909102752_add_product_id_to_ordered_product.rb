class AddProductIdToOrderedProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_products, :product_id, :integer
  end
end
