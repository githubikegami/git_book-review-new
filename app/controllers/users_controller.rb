class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @comment = @user.comments
    end
    
    def edit
    end
    
    def update
    current_user.update(update_params)
    redirect_to "/users/#{current_user.id}"
    end
    
    private
    def update_params
    params.require(:user).permit(:nickname, :email, :image,:text)
    end
  
end
