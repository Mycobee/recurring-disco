# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]).order_comments
    @comments = @article.comments
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
