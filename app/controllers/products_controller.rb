class ProductsController < ApplicationController
	def top
		@products = Product.all
		@genres = Genre.all
	end
	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end
	def index
		@genres = Genre.all
		@products = Product.all
	end
end
