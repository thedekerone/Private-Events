class EventsController < ApplicationController
  def new
    @event = Event.new    
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id  = session[:user_id]
    if @event.save
      redirect_to user_path(@event.creator)
    else
      render :new 
    end   
  end

  def index
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :event_date)
  end
end
