class Genre < ApplicationRecord
	has_many :products

	enum effectiveness: {有効: true, 無効: false}
end
