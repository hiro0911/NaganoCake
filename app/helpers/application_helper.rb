module ApplicationHelper
	def total_price(cart_items)
		price = 0
		cart_items.each do |cart_item|
			price += cart_item.count * cart_item.product.price
		end
		return price
	end
	def all_address
		delivery.postcode + delivery.address + delivery.name
	end
end
