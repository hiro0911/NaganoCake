class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :description
      t.string :text
      t.integer :price
      t.boolean :sales_status
      t.string :image_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
