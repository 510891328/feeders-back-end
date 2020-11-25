class ArticlesController < ApplicationController
  skip_before_action :authorized, only: [:user_articles, :destroy]
  def user_articles

    user = User.find(params['user_id'])

    articles = user.articles

    render json: articles
  end

  def create
    token = JWT.decode(params[:token], ENV['AUTH_SECRET'], 'HS256')

    user = User.find(token[0]['user_id'])

    article = user.articles.create!(article_params)

    render json: article

  end

  def destroy

    article = Article.find(params[:id])

    render json: article

    article.destroy

  end

  private

  def article_params
    params.require(:article).permit(:title, :summary, :source, :url, :released, :author, :img)
  end

end
