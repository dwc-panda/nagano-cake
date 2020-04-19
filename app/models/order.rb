class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details, dependent: :destroy
	enum payment_type: {
		クレジットカード: 0,
		銀行振り込み: 1
	}
end
