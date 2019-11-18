class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :zip_code, presence: true, numericality: true
  validates_presence_of :password, :name, :street_address, :city, :state
  enum role: [:default, :admin]
end
