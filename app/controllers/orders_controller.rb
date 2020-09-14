class OrdersController < ApplicationController
	def new
		@delivery = Delivery.find_by(customer_id: current_customer.id)
		@deliveries = Delivery.where(customer_id: current_customer.id)
	end
	def confirm
		@order = Order.new(customer_id: current_customer.id
											 payment: params[:payment]
											 postage: 800)

		if params[:order][:addresses] == "ご自身の住所"
			@order.postcode = current_customer.postcode
			@order.address = current_customer.address
			@order.name = current_customer.name
		end
		if params[:order][:addresses] == "登録住所から選択"
			@delivery = Delivery.find_by(id: params[:delivery_id])
			@order.postcode = @delivery.postcode
			@order.address = @delivery.address
			@order.name = @delivery.name
		end
		if params[:order][:addresses] == "新しいお届け先"
			@order.postcode = params[:order][:postcode]
			@order.address = params[:order][:address]
			@order.name = params[:order][:name]
		end	
	end
	def create

	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :name, :postcode, :address, :postage, :billing_amount, :payment, :order_status)
	end
end
