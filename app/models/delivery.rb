class Delivery < ApplicationRecord
	belongs_to :customer

	def order_address
		self.postcode + self.address + self.name
	end
end
