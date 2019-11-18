# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor on registration path' do
  describe 'When I fill out the new user form completely' do it 'redirects me to my profile page with a flash message confirming I am logged in' do
      visit registration_path

      within '.new-user-form' do
        fill_in 'Name', with: 'Jane Doe'
        fill_in 'Street address', with: '123 Street Rd.'
        fill_in 'City', with: 'Chicago'
        fill_in 'State', with: 'Illinois'
        fill_in 'Zip code', with: 55_555
        fill_in 'Email', with: 'tester1@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'

        click_button 'Create Account'
      end

      expect(page).to have_content('Registration Successful! You are now logged in.')
      user = User.last

      expect(user.name).to eq('Jane Doe')
      expect(user.street_address).to eq('123 Street Rd.')
      expect(user.city).to eq('Chicago')
      expect(user.state).to eq('Illinois')
      expect(user.zip_code).to eq(55_555)
      expect(user.email).to eq('tester1@gmail.com')
    end
  end

  describe 'When I do not fill out correct values' do
    it 'displays flash messages for each field' do
      visit registration_path

      click_button 'Create Account'

      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip code can't be blank")
      expect(page).to have_content('Zip code is not a number')
      expect(page).to have_content("Email can't be blank")
    end

    it 'should display an error when an email is taken' do
      create(:user, email: 'example@gmail.com')

      visit registration_path

      fill_in :user_name, with: 'name_1'
      fill_in :user_street_address, with: 'address_1'
      fill_in :user_city, with: 'city_1'
      fill_in :user_state, with: 'state_1'
      fill_in :user_zip_code, with: 'zip_1'
      fill_in :user_email, with: 'example@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'

      click_button 'Create Account'

      expect(page).to have_content('Email has already been taken')
      expect(page).to have_css("input[value='name_1']")
      expect(page).to have_css("input[value='address_1']")
      expect(page).to have_css("input[value='city_1']")
      expect(page).to have_css("input[value='state_1']")
      expect(page).to have_css("input[value='zip_1']")
      expect(page).to_not have_css("input[value='example@gmail.com']")
      expect(page).to_not have_css("input[value='password']")
    end
  end
end
