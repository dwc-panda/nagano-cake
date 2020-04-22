class Delivery < ApplicationRecord
	belongs_to :end_user

	validates :direction, presence: true
	validates :address, presence: true
	validates :postcode, presence: true

	def full_address
		self.postcode + self.address + self.direction
	end
end
