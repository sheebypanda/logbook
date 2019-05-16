class SisController < ApplicationController
  before_action :set_si, only: [:show, :edit, :update, :destroy]

  def index
    @sis = Si.all
  end

  def show
  end

  def new
    @si = Si.new
  end

  def edit
  end

  def create
    @si = Si.new(si_params)

    respond_to do |format|
      if @si.save
        format.html { redirect_to sis_path, notice: 'Si was successfully created.' }
        format.json { render :show, status: :created, location: @si }
      else
        format.html { render :new }
        format.json { render json: @si.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @si.update(si_params)
        format.html { redirect_to @si, notice: 'Si was successfully updated.' }
        format.json { render :show, status: :ok, location: @si }
      else
        format.html { render :edit }
        format.json { render json: @si.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @si.destroy
    respond_to do |format|
      format.html { redirect_to sis_url, notice: 'Si was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_si
      @si = Si.find(params[:id])
    end

    def si_params
      params.require(:si).permit(:name, :trigram)
    end
end
