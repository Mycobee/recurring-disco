require 'rails_helper'

describe "As a logged in user to the site" do
  describe "I see a navigation bar" do
    it "contains links to the home, logout, profile, and articles paths" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path

      within(".navbar") do
        expect(current_path).to eq("/")  
        expect(page).to have_link("Log out")

        click_link("Articles")
        expect(current_path).to eq("/articles")

        click_link("Welcome")
        expect(current_path).to eq(root_path)

        expect(page).to_not have_link("Log in")
        expect(page).to_not have_link("Sign Up")
      end
    end
  end
end
