class CommentsController < ApplicationController
  include CommentsHelper
  before_action :set_article

  def create
    @comment = @article.comments.new comment_params
    if @comment.save
      redirect_to article_path(@article)
    else
      render article_path(@article)
    end
  end
end
