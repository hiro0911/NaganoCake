class OrdersController < ApplicationController
	def new
		@delivery = Delivery.find_by(customer_id: current_customer.id)
	end
end
