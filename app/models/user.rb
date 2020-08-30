class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, :email, :birthday, presence: true
  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :sex_kana, :name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
