class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		if @product.save!
			redirect_to admin_products_path
		else
			reder "new"
		end
	end
	def show
		@product = Product.find(params[:id])
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_product_path(@product)
		else
			render "edit"
		end
	end
	def index
		@products = Product.all
	end

	private

	def product_params
		params.require(:product).permit(:genre_id, :name, :description, :price, :sales_status, :image)
	end
end
