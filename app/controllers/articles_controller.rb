class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    if params[:query].present?
      @articles = Article.where("title LIKE ?", "%#{params[:query]}%").page(params[:page])
      create_query(params[:query])
    else
      @articles = Article.all.page(params[:page])
    end

    if turbo_frame_request?
      render partial: "articles", locals: { articles: @articles}
    else
      render :index
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  private
    def create_query(query)
      return unless query.length >= 3
      if Query.last
        last_query = Query.last
      else
        last_query = Query.create!(body: query, user: current_user)
      end

      similarity = String::Similarity.cosine last_query.body, query
      if similarity > 0.7
        last_query.update(body: query)
      else
        Query.create!(body: query, user: current_user)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :author)
    end
end
