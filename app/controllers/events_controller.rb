class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_beginning_of_week, only: [:index, :checks, :calendrier]
  before_action :get_events, only: [:index, :checks, :calendrier]

  def index
    @events_recurrent = Event.where(recurrent: true)
  end

  def calendrier
    @month_events = Event.where(recurrent: false)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Événement créé.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Événement mis à jour.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Événement supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_beginning_of_week
      Date.beginning_of_week = :monday
    end

    def get_events
      @events = Event.where(recurrent: false)
      @today_events = Event.where(start_date: Date.today.all_day, recurrent: false).or(Event.where(end_date: Date.today.all_day, recurrent: false))
      @events_recurrent = Event.where(recurrent: true)
    end

    def event_params
      params.require(:event).permit(:user_id, :si_id, :priority_id, :category_id, :subject_id, :start_date, :end_date, :description, :disable, :recurrent)
    end
end
