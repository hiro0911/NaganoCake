class OrdersController < ApplicationController
	def new
		@delivery = Delivery.find_by(customer_id: current_customer.id)
		@deliveries = Delivery.where(customer_id: current_customer.id)
	end
	def confirm
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@order = Order.new(customer_id: current_customer.id,
											 payment: params[:payment],
											 postage: 800)

		if params[:addresses] == "ご自身の住所"
			@order.postcode = current_customer.postcode
			@order.address = current_customer.address
			@order.name = current_customer.full_name
		end
		if params[:addresses] == "登録住所から選択"
			@delivery = Delivery.find_by(id: params[:delivery_id])
			@order.postcode = @delivery.postcode
			@order.address = @delivery.address
			@order.name = @delivery.name
		end
		if params[:addresses] == "新しいお届け先"
			@order.postcode = params[:order][:postcode]
			@order.address = params[:order][:address]
			@order.name = params[:order][:name]
		end	
	end
	def create
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@order = Order.new(order_params)
		if @order.save!
			if params[:addresses] == "新しいお届け先"
				Delivery.create!(customer_id: current_customer.id,
												 name: @order.name,
												 postcode: @order.postcode,
												 address: @order.address)
			end
			@cart_items.each do |cart_item|
				OrderedProduct.create!(order_id: @order.id,
															 product_id: cart_item.product.id,
															 count: cart_item.count,
															 price: cart_item.product.price * cart_item.count * 1.1 )
			end
			redirect_to orders_thanks_path
		else
			render "new"
		end
	end
	def thanks
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :name, :postcode, :address, :postage, :billing_amount, :payment, :order_status)
	end
end
