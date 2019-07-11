class VerificationsController < ApplicationController
  before_action :get_event_recur, :today_events, only: :index
  before_action :set_verification, only: :destroy

  def index
  end

  def new
  end

  def create
    @verification = Verification.new(verification_params)
    respond_to do |format|
      if @verification.save
        format.js
      end
    end
  end

  def destroy
    @verification.destroy!
    respond_to do |format|
      format.js
    end
  end

  private

  def verification_params
    params.require(:verification).permit(:user_id, :event_id, :date, :commentaire)
  end

  def today_events
    @today_events = Event.where("start_date <= ?", DateTime.now.beginning_of_day).where("end_date >= ?", DateTime.now.end_of_day).where(recurrent: false)
  end
  def get_event_recur
    @events_recurrent = Event.where(recurrent: true)
  end
  def set_verification
    @verification = Verification.find(params[:id])
  end
end
