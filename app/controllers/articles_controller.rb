class ArticlesController < ApplicationController
     before_action :params_find, only: [:show, :edit, :update, :destroy]

    def show
            # @article = Article.find(params[:id])
    end

    def index
            @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params_req)
         if @article.save
            flash[:notice] = "Article was Created Successfully"
        # redirect_to article_path(@article)
            redirect_to @article #rails is smart enough just to pick the id and redirect to show page
        else
          render :new, status: :unprocessable_entity #for it render this page again, the method of this page must know about the @article.
        end
    end

    def edit
        # @article = Article.find(params[:id])
    end

     def update
    #    @article = Article.find(params[:id])
       if @article.update(params_req)
          flash[:notice] = "Article updated"
          redirect_to @article #this will redirect to show page
       else
          render 'edit', status: :unprocessable_entity
       end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private

    def params_find
        @article = Article.find(params[:id])
    end

    def params_req
        params.require(:article).permit(:title, :description)
    end


end

