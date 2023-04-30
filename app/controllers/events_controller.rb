class EventsController < ApplicationController
  before_action :authenticate_user!
  
def index
  @events = Event.all
end

def show
end

def new
  @event = current_user.hostings.build
end

def edit
end

def create
  @event = current_user.hostings.build(event_params)

  respond_to do |format|
    if @event.save
      format.html { redirect_to root_path, notice: "Event was successfully created." }
      format.json { render :show, status: :created, location: @event }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @event.update(event_params)
      format.html { redirect_to root_path, notice: "Event was successfully updated." }
      format.json { render :show, status: :ok, location: @event }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @event.destroy

  respond_to do |format|
    format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
    format.json { head :no_content }
  end
end

  private

  def event_params
    params.require(:event).permit(:day, :place)
  end
end
