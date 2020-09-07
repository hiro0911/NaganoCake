class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer
end
