class CartItemsController < ApplicationController
	def create
		@cart_item = CartItem.new(cart_item_params)
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
