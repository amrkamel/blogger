module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find params[:id] if params[:id]
  end
end
