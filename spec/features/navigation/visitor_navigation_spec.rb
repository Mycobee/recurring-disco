require 'rails_helper'

describe "As a visitor to the site" do
	describe "I see a navigation bar" do
		it "contains links to the home, login, registration, and articles paths" do
		  visit root_path

      within("#navbar") do
        expect(current_path).to eq("/")  

        click_link("Login")
        expect(current_path).to eq("/login")

        click_link("Sign Up")
        expect(current_path).to eq("/register")

        click_link("Articles")
        expect(current_path).to eq("/articles")

        click_link("Welcome")
        expect(current_path).to eq(root_path)
      end
		end
	end
end

