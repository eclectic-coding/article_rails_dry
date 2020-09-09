class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article successfully updated"
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article successfully deleted."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
