class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :orders
	has_many :deliveries, dependent: :destroy
	has_many :cart_items, dependent: :destroy

	enum admission_status: {有効会員: true, 退会済み: false}

	def full_name
  	self.family_name_kanji + self.first_name_kanji
  end
  def full_name_kana
    self.family_name_kana + self.first_name_kana
  end
  def active_for_authentication?
    super && (self.admission_status === "有効会員")
  end
  def full_address
    self.postcode + self.address + self.full_name
  end
end
