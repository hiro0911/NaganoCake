class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer
	enum order_status: {入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5}
	enum payment: {クレジットカード: 1, 銀行振込: 2}

	def full_address
		self.postcode + self.address + self.name
	end
end
