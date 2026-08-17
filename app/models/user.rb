class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email, presence: true, uniqueness: { message: :taken_email }
  validates :password, presence: true
  validates :name, presence: { message: :blank_name }
end
