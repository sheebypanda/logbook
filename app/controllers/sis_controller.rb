class SisController < ApplicationController
  before_action :set_si, only: [:show, :edit, :update, :destroy]

  # GET /sis
  # GET /sis.json
  def index
    @sis = Si.all
  end

  # GET /sis/1
  # GET /sis/1.json
  def show
  end

  # GET /sis/new
  def new
    @si = Si.new
  end

  # GET /sis/1/edit
  def edit
  end

  # POST /sis
  # POST /sis.json
  def create
    @si = Si.new(si_params)

    respond_to do |format|
      if @si.save
        format.html { redirect_to @si, notice: 'Si was successfully created.' }
        format.json { render :show, status: :created, location: @si }
      else
        format.html { render :new }
        format.json { render json: @si.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sis/1
  # PATCH/PUT /sis/1.json
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

  # DELETE /sis/1
  # DELETE /sis/1.json
  def destroy
    @si.destroy
    respond_to do |format|
      format.html { redirect_to sis_url, notice: 'Si was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_si
      @si = Si.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def si_params
      params.require(:si).permit(:name, :trigram)
    end
end
