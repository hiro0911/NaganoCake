class Admin::OrdersController < ApplicationController
	def top
	end
	def show
		@order = Order
	end
	def index
		@order = Order.all
	end
end
