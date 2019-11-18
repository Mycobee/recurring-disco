require 'rails_helper'

describe "As a visitor or user on the articles index page" do
	describe "I see a list of all articles in the database" do
		before :each do
			@article_1 = create(:article)	
			@article_2 = create(:article)	
			@article_3 = create(:article)	
		end
		
		it "Displays each title as a show page link, and a preview of the body" do
	    visit articles_path		

      within "#article_#{@article_1.id}" do
        expect(page).to have_content(@article_1.title)
        expect(page).to have_content(@article_1.body_preview)
      end

      within "#article_#{@article_2.id}" do
        expect(page).to have_content(@article_2.title)
        expect(page).to have_content(@article_2.body_preview)
      end

      within "#article_#{@article_3.id}" do
        expect(page).to have_content(@article_3.title)
        expect(page).to have_content(@article_3.body_preview)
      end

      expect(Article.all.size).to eq(3)
		end
	end
end
