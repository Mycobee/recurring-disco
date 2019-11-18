require 'rails_helper'

describe "As a visitor on registration path" do
	describe "When I fill out the new user form completely" do
		it "redirects me to my profile page with a flash message confirming I am logged in" do
      visit registration_path
save_and_open_page
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

      expect(page).to have_content( "Registration Successful! You are now logged in.")
      user = User.last

      expect(user.name).to eq('Jane Doe')
      expect(user.street_address).to eq('123 Street Rd.')
      expect(user.city).to eq('Chicago')
      expect(user.state).to eq('Illinois')
      expect(user.zip_code).to eq(55555)
      expect(user.email).to eq('tester1@gmail.com')
		end
	end

  describe "When I do not fill out necessary values" do
    it "displays flash messages for each field" do
      visit registration_path
      
      click_button "Create Account"
save_and_open_page

      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip code can't be blank")
      expect(page).to have_content("Zip code is not a number")
      expect(page).to have_content("Email can't be blank")
    end
  end
end

