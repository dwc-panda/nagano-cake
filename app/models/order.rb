class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details, dependent: :destroy

	validates :direction, presence: true
	validates :address, presence: true
	validates :postcode, presence: true

	enum payment_type: {
		クレジットカード: 0,
		銀行振り込み: 1
	}

	enum order_status: {
		入金待ち: 0,
		入金確認: 1,
		制作中: 2,
		発送準備中: 3,
		発送済み: 4
	}
end
