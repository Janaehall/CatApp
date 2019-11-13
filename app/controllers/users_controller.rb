class UsersController < ApplicationController
  before_action :authorized, only: [:edit, :destroy]
  
    def new
        @user = User.new
    end

    def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to new_user_path
      end
    end


    private

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end
