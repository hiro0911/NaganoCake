class Admin::OrderedProductsController < ApplicationController
	def update
		@ordered_product = OrderedProduct.find(params[:id])
		@ordered_products = OrderedProduct.where(order_id: @ordered_product.order_id)
		@order = Order.find_by(id: @ordered_product.order_id)
		@ordered_product.update(ordered_product_params)
		count = 0
		@ordered_products.each do |ordered_product|
			if ordered_product.production_status == "製作中"
				@order.update(order_status: "製作中")
			end
			if ordered_product.production_status == "製作完了"
				count += 1
				if count == @ordered_products.count
					@order.update(order_status: "発送準備中")
				end
			end
		end
		redirect_to admin_order_path(@ordered_product.order_id)
	end
	private
	def ordered_product_params
		params.require(:ordered_product).permit(:order_id, :count, :price, :production_status, :product_id)
	end
end
