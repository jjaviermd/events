class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def show

  end

  def new
    @event = current_user.hostings.build
  end

  def create
    @event = current_user.hostings.build(event_params)
    if @event.save 
      redirect_to root_path
      flash[:notice] = "Event succesfully created. Have fun!"
    else
      flash.now[:error] = "It was not possible to create the event" 
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy
  
  end

  private

  def event_params
    params.require(:event).permit(:day, :place)
  end
end
