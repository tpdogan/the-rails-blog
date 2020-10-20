class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
=begin
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "New article is successfully created."
      format.html { redirect_to article_path(@article) }
      format.json { render :show, status: :created, location: @article}
    else
      flash[:error] = "Not all fields are filled."
      format.html { render :new }
      format.json { render json: @article.errors, status: :unprocessable_entity}
    end
=end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
