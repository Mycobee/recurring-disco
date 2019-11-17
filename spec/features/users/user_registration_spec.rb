require 'rails_helper'

describe "As a visitor on registration path" do
	describe "When I fill out the new user form completely" do
		it "redirects me to my profile page with a flash message confirming I am logged in" do
      visit registration_path

      within '#new-user-form' do
        fill_in 'Name', with: 'Jane Doe'		
        fill_in 'Street Address', with: 'Jane Doe'		
        fill_in 'City', with: 'Jane Doe'		
        fill_in 'State', with: 'Jane Doe'		
        fill_in 'Zip Code', with: 'Jane Doe'		
        fill_in 'Email', with: 'Jane Doe'		
        fill_in 'Password', with: 'Jane Doe'		
        fill_in 'Password Confirmation', with: 'Jane Doe'		
        click_button 'Create User'
      end

      #expect a flash message
      expect(current_path).to eq(profile_path)

      #user = User.last
      #expect all the things to be right
		end
	end
end

