class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
end
