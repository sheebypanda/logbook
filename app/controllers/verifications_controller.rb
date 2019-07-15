class VerificationsController < ApplicationController
  before_action :set_verification, only: :destroy
  before_action :get_verifications, only: :index
  def index
    @events_recurrent = Event.where(recurrent: true)
    @today_events = Event.where(["recurrent = ? AND start_date <= ? AND end_date >= ?", false, DateTime.now.end_of_day, DateTime.now.beginning_of_day])
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
  def get_verifications
    @verifications = Verification.where(date: params['date']) if params['date']
  end
  def set_verification
    @verification = Verification.find(params[:id])
  end
end
