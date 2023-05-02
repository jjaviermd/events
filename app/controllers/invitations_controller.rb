class InvitationsController < ApplicationController

  def create
    @invitation = @event.invitations.build(user_id: current_user.id)
    if @invitation.save
      redirect_to root_path, notice: "You are in the guest list"
    else
      
    end
  end

 
end