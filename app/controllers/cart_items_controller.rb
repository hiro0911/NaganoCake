class CartItemsController < ApplicationController
	def create
		@cart_items = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		if @cart_item.save!
			redirect_to products_path
		else
			render "products/show"
		end
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:customer_id, :product_id, :count)
	end
end
