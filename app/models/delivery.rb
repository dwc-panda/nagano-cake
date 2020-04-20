class Delivery < ApplicationRecord
	belongs_to :end_user

	def full_address
		self.postcode + self.address + self.direction
	end
end
