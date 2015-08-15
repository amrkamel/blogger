module CommentsHelper
  def set_article
    @article = Article.find params[:article_id]
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
