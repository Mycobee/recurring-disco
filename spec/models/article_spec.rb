require 'rails_helper'

RSpec.describe Article, type: :model do
  before :each do
    title = "Nuanced Thoughts"
    body = "Lorem ipsum dolor sit amet, rebum putant ex has, et duo rebum saperet incorrupte. At tale dolores luptatum eum, id his libris copiosae philosophia, sumo putant reprimique id sit. Ut duo ferri oporteat concludaturque, id sumo clita laoreet nam. Sed labores scripserit in.
    
    Ne nam putent dignissim. Ad nostrud facilis conceptam nec, illud ancillae expetenda et duo. Viris tantas ea nec, putant ancillae vituperatoribus est ut, cum ad quod dicant inimicus. Pri graece vidisse utroque ex, vel ut vitae appareat qualisque, noster aliquip diceret ut vim. Feugiat antiopam sententiae eu sea."
    @article = Article.create!(title: title, body: body)
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)

    @comment_1 = Comment.create!(body: "It rocks!", user_id: @user_3.id, article_id: @article.id,  created_at: 5.days.ago)
    @comment_2 = Comment.create!(body: "It is okay", user_id: @user_2.id, article_id: @article.id, created_at: 3.days.ago)
    @comment_3 = Comment.create!(body: "It is not so good", user_id: @user_1.id, article_id: @article.id, created_at: 1.day.ago)
  end

  describe 'relationship' do
    it { should have_many :comments }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  describe 'instance methods' do
    it '#preview' do
      expect(@article.preview).to eq("Lorem ipsum dolor sit amet, rebum putant ex has, et duo...")
    end

    it '#order_comments' do
      expect(@article.order_comments.comments.first).to eq(@comment_3)
      expect(@article.order_comments.comments.last).to eq(@comment_1)
    end
  end
end
