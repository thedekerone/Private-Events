class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @event = User.find(params[:id]).created_events
    @attend = User.find(params[:id]).attended_event
    @upcomming_events = @event.upcomming
    @past_events = @event.previews
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
