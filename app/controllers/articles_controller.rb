# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    Rails.cache.fetch("articles_index", expires_in: 24.hours) do
      @articles = Article.all
    end
  end

  def show
    Rails.cache.fetch("articles_index", expires_in: 15.minutes) do
      @article = Article.find(params[:id]).order_comments
      @comments = @article.comments
    end
    handle_redirect
  end

  private

  def handle_redirect
    if current_user.nil?
      redirect_to login_path
    elsif !current_user.recurring?
      redirect_to recurly_path
    end
  end
end
