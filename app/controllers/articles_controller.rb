class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find params[:id]
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

  def destroy
    @article = Article.find params[:id]
    if @article.destroy
      flash[:notice] = 'Article has been removed successfully'
      redirect_to articles_path
    else
      flash[:error] = 'Article could not been deleted.'
      render action: :index
    end
  end
end
