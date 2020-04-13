class BookreviewController < ApplicationController

    def index
        @bookreviews = Bookreview.includes(:user).page(params[:page]).per(12)
    end
    
    def show
        @bookreviews = Bookreview.find(params[:id])
        @comments = Comment.new
        @remarks = @bookreviews.comments.includes(:user)
    end
    
    def search
        @bookreviews = Bookreview.where('title LIKE(?)', "%#{params[:keyword]}%")
    end

end
