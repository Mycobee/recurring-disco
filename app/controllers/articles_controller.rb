# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]).order_comments
    @comments = @article.comments
    redirect_to recurly_path if non_recurring
  end
end
