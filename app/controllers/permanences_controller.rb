class PermanencesController < ApplicationController
  before_action :get_permanence, only: :destroy

  def index
  end

  def new
  end

  def create
    @permanence = Permanence.new(permanence_params)
    respond_to do |format|
      if @permanence.save
        format.js
      end
    end
  end

  def destroy
    @permanence.destroy!
    respond_to do |format|
      format.js
    end
  end

  private

  def permanence_params
    params.require(:permanence).permit(:date, :user_id, :morning)
  end

  def get_permanence
    @permanence = Permanence.find(params[:id])
  end


end
