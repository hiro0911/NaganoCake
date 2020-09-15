class CustomersController < ApplicationController
	def show
		@customer = current_customer
	end
	def edit
		@customer = current_customer
	end
	def update
		@customer = current_customer
		if @customer.update(customer_params)
			redirect_to customer_path(current_customer.id)
		else
			render "edit"
		end
	end
	def withdrow
		@customer = current_customer
	end
	def switch
		@customer = Customer.find(params[:id])
		@customer.admission_status = false
		@customer.update(customer_params)
		reset_session
		redirect_to root_path
		
	end
	private
	def customer_params
		params.require(:customer).permit(:email,
																     :password,
													           :family_name_kanji, 
													           :family_name_kana,
													           :first_name_kanji,
													           :first_name_kana,
													           :postcode,
													           :address,
													           :tel,
													           :admission_status)
	end
end
