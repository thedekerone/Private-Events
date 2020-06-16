class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if(@user.save)
            render json: @user
        else
            render "new"
        end
    end

    def signin(id)
        @user = User.find(id)
        session[:user_id]=@user.id
    end

    def show
        
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end
