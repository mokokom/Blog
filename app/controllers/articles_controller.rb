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
		@article = Article.new(articles_params)
		if @article.save
		flash[:notice] = "Article has been created successfully"
			redirect_to @article
		else
			render :new
		end
	end

	private

	def articles_params
		params.require(:article).permit(:title, :description)
	end
end
