class Genre < ApplicationRecord
	has_many :items, dependent: :destroy

	validates :name, presence: true

	enum is_valid: {
		売切れ: true,
		販売中: false
	}
end
