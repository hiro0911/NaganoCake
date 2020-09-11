class ProductsController < ApplicationController
	def top
		@products = Product.all
		@genres = Genre.all
	end
	def show
		@product = Product.find(params[:id])
	end
end
