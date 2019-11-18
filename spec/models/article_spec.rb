require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  describe 'instance methods' do
    it '#preview' do
      title = "Nuanced Thoughts"
      body = "Lorem ipsum dolor sit amet, rebum putant ex has, et duo rebum saperet incorrupte. At tale dolores luptatum eum, id his libris copiosae philosophia, sumo putant reprimique id sit. Ut duo ferri oporteat concludaturque, id sumo clita laoreet nam. Sed labores scripserit in.

      Ne nam putent dignissim. Ad nostrud facilis conceptam nec, illud ancillae expetenda et duo. Viris tantas ea nec, putant ancillae vituperatoribus est ut, cum ad quod dicant inimicus. Pri graece vidisse utroque ex, vel ut vitae appareat qualisque, noster aliquip diceret ut vim. Feugiat antiopam sententiae eu sea."
      article = Article.create(title: title, body: body)
      
      expect(article.preview).to eq("Lorem ipsum dolor sit amet, rebum putant ex has, et duo")
    end
  end
end
