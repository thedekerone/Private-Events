class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[:user_id])
    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to user_path(@event.creator)
    else
      render :new
    end
  end

  def index
    @user = User.find(session[:user_id])
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attend = @event.attendee
  end

  def edit
    @event = Event.find(params[:id])
    @add_attend = EventAttending.new
    @add_attend.attended_event_id = @event.id
    @add_attend.event_attendee_id = session[:user_id]
    if @add_attend.save
      redirect_to events_path
    else
      redirect_to root_url
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :description)
  end
end
