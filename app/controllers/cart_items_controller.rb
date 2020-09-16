class CartItemsController < ApplicationController
	def create
		@cart_item = CartItem.new(cart_item_params)
		if @cart_item.save!
			redirect_to cart_items_path
		else
			render "products/show"
		end
	end
	def index
		@cart_items = CartItem.where(customer_id: current_customer.id)
	end
	def update
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update(cart_item_params)
			redirect_to cart_items_path
		else
			render "index"
		end
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:customer_id, :product_id, :count)
	end
end
