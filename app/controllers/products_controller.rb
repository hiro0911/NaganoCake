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
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = Product.where(genre_id: params[:genre_id])
		else
			@products = Product.all
		end
	end
end
