require 'rails_helper'

describe "As a visitor on registration path" do
	describe "When I fill out the new user form completely" do
		it "redirects me to my profile page with a flash message confirming I am logged in" do
      visit registration_path

      within '.new-user-form' do
        fill_in 'Name', with: 'Jane Doe'		
        fill_in 'Street address', with: '123 Street Rd.'
        fill_in 'City', with: 'Chicago'		
        fill_in 'State', with: 'Illinois'		
        fill_in 'Zip code', with: 55555		
        fill_in 'Email', with: 'tester1@gmail.com'		
        fill_in 'Password', with: 'password'		
        fill_in 'Password confirmation', with: 'password'		

        click_button 'Create Account'
      end

      expect(page).to have_content("Account successfully created!")
      user = User.last

      expect(user.name).to eq('Jane Doe')
      expect(user.street_address).to eq('123 Street Rd.')
      expect(user.city).to eq('Chicago')
      expect(user.state).to eq('Illinois')
      expect(user.zip_code).to eq(55555)
      expect(user.email).to eq('tester1@gmail.com')
		end
	end
end

