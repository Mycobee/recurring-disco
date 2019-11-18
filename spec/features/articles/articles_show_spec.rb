require 'rails_helper'

describe "As a user on the articles index page" do
	describe "When I click an article title" do
		before :each do
      @user_1 = create(:user)
      @user_2 = create(:non_recurring_user)
			@article_1 = create(:article)	
			@article_2 = create(:article)	
		end
		
		it "Renders the article show page, with the title and full body for a recurring user" do
      login_as(@user_1)
	    visit articles_path

      within "#article-#{@article_1.id}" do
        click_link(@article_1.title)
      end

      expect(current_path).to eq(article_path(@article_1))
      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
		end

    it "Renders a Recurly sign up path for a non recurring user" do
      login_as(@user_2)
	    visit articles_path

      within "#article-#{@article_1.id}" do
        click_link(@article_1.title)
      end

      expect(current_path).to eq(recurly_path)
      expect(page).to_not have_content(@article_1.title)
      expect(page).to_not have_content(@article_1.body)
    end 
	end
end
