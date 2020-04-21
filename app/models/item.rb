class Item < ApplicationRecord
	attachment :image
	has_many :order_details, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	belongs_to :genre

	enum is_valid: {
		無効: true,
		有効: false
	}
end
