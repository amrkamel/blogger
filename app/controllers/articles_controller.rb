class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :set_article, only: [:show, :update, :destroy, :edit]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article = @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to article_path(@article)
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    @article.update_attributes article_params
    if @article.save
      flash.notice = 'Article has been edited successfully.'
      redirect_to article_path(@article)
    else
      render action: :edit
    end
  end

  def destroy
    if @article.destroy
      flash.notice = 'Article has been removed successfully.'
      redirect_to articles_path
    else
      render action: :index
    end
  end
end
