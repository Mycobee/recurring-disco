require 'rails_helper'

describe "As a user on an article show page" do
	describe "I fill in a box to add a comment and click submit" do
		before :each do
	    @non_recurring_user = create(:non_recurring_user)	
	    @user = create(:user)	
		end
		
		it "Posts the comment and displays it at the top of the list" do
	    visit article_path(@article)
      comment_text = "Comments can be long or short, witty or crude, polite or mean.  But commentary is a necessary part of human discourse, therefore I hope to facilitate it with this text"
      fill_in "#comment-box", with: comment_text
      click_button "Add Comment"

      expect(current_path).to eq(article_path(@article))

      expect(page).to have_content(comment_text)
		end
	end
end

