class DeliveriesController < ApplicationController
	def index
		@delivery = Delivery.new
		@deliveries = Delivery.where(customer_id: current_customer.id)
	end
	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.customer_id = current_customer.id
		if @delivery.save!
			redirect_to deliveries_path
		else
			render "index"
		end
	end
	def destroy
		@delivery = Delivery.find(params[:id])
		if @delivery.destroy
			redirect_to deliveries_path
		else
			render "index"
		end
	end
	private
	def delivery_params
		params.require(:delivery).permit(:customer_id, :name, :postcode, :address)
	end
end
