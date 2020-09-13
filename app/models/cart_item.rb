class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	attachment :image
end
