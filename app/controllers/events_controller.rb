class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    cookies[:current_event] = @event.id
  end

  def new
    @event = current_user.hostings.build
  end

  def edit
    @event = Event.find(params[:id])
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
    format.html { redirect_to events_url, notice: "Event was successfully canceled." }
    format.json { head :no_content }
  end
end

def unattend
  @event = Event.find(params[:id])
  current_invitation = Invitation.find_by(user_id: current_user.id, event_id: @event.id)
  current_invitation.destroy

  redirect_to @event, notice: "You are no longer attending this event!"
end

private

  def event_params
    params.require(:event).permit(:day, :place)
  end

  def correct_user
    @event = current_user.hostings.find_by(id: params[:id])
    redirect_to root_path, notice: "You can't perform that action!" if @event.nil?
  end
end
