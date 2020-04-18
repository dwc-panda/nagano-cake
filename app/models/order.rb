class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details, dependent: :destroy
	enum payment_type: [:クレジットカード, :銀行振込]
end
