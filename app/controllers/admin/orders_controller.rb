class Admin::OrdersController < ApplicationController
	def top
		@orders = Order.where(created_at: Date.today.all_day)
	end
	def show
		@order = Order.find(params[:id])
		@ordered_products = OrderedProduct.where(order_id: @order.id)
	end
	def update
		@order = Order.find(params[:id])
		@ordered_products = OrderedProduct.where(order_id: @order.id)
		if @order.update(order_params)
			if @order.order_status == "入金確認"
				@ordered_products.each do |ordered_product|
					ordered_product.update(production_status: "製作待ち")
				end
			end
			redirect_to admin_order_path(@order)
		else
			render "show"
		end
	end
	def index
		@orders = Order.all
	end
	def order_params
		params.require(:order).permit(:customer_id, :name, :postcode, :address, :postage, :billing_amount, :payment, :order_status,)
	end
end
