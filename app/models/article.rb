class Article < ApplicationRecord
  validates_presence_of :title, :body

  def preview
    body.split(" ")[0..10].join(' ')
  end
end
