class InvitationsController < ApplicationController

  def create
    @invitation = Invitation.new(event_id: cookies[:current_event], user_id: current_user.id)
    if @invitation.save
      redirect_to root_path, notice: "You are in the guest list"
      cookies.delete :current_event
    else
      
    end
  end

 
end