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

    def show
        @events = User.find(params[:id]).created_events        
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end
