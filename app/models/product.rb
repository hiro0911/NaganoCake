class Product < ApplicationRecord
	has_many :ordered_products
	has_many :cart_items
	has_many :orders, through: :ordered_products
	belongs_to :genres
	attachment :image
end
