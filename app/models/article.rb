class Article < ApplicationRecord
  has_many :comments
  validates_presence_of :title, :body

  def preview
    body.split(" ")[0..10].join(' ') + "..."
  end

  def order_comments
    Article.where(id: self.id).includes(:comments).order('comments.created_at DESC').first
  end
end
