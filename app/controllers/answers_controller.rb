class AnswersController < ApplicationController
  #before_action :signed_in_user

  def create
    @option = Option.find(params[:option][:event_id])
    current_user.attend!(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @attending = Attending.find(params[:id])
    @event = Event.find(@attending.event_id)
    current_user.unattend!(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

end