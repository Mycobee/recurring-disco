require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :comments }
  end

  describe 'validations' do 
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :name }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_numericality_of :zip_code }
    it { should validate_presence_of :zip_code }
  end

  describe 'roles' do
    it 'can be created as a default user' do
      user = User.create(
        email: "email",
        password: "password",
        name: "name",
        street_address: "address",
        city: "city",
        state: "state",
        zip_code: 80503
      )
      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
    
    it 'can be created as a admin' do
      user = User.create(
        email: "email",
        password: "password",
        name: "name",
        street_address: "address",
        city: "city",
        state: "state",
        zip_code: 80503,
        role: 1
      )
      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end
  end
end
