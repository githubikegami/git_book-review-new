class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @comment = @user.comments
        # ＠userを優先して使用したいが上手くいくかわからない為@imageと＠nicknameを残す
        # @bookreviews = user.bookreview.page(params[:page]).per(5).order("created_at DESC")
    end
    
    # def destroy
    # tweet = Tweet.find(params[:id])
    #     if tweet.user_id == current_user.id
    #       tweet.destroy
    #     end
    # end
    
    def edit
    end
    
    def update
    current_user.update(update_params)
    redirect_to "/users/#{current_user.id}"
    end
    
    private
    def update_params
    params.require(:user).permit(:nickname, :email, :image)
    end
  
end
