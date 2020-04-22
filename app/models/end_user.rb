class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ } #全角カタカナ
  validates :last_kana_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :postcode, presence: true, format: { with: /\A[0-9]+\z/ } #半角数字
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/ }

  def active_for_authentication?
    super && (self.is_deleted == "有効")
  end

  enum is_deleted: {
    退会済: true,
    有効: false
  }

end
