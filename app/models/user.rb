class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :zip_code, presence: true, numericality: true
  validates :recurring, inclusion: { in: [true, false] }, presence: true
  validates_presence_of :password, :name, :street_address, :city, :state
end
