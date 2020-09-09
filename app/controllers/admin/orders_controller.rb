class Admin::OrdersController < ApplicationController
	def top
	end
	def show
		@order = Order.find(params[:id])
	end
	def index
		@orders = Order.all
	end
end
