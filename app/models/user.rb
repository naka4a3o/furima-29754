class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
end
