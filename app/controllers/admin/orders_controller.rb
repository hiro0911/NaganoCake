class Admin::OrdersController < ApplicationController
	def top
		@orders = Order.where(created_at: Date.today)
	end
	def show
		@order = Order.find(params[:id])
	end
	def index
		@orders = Order.all
	end
end
