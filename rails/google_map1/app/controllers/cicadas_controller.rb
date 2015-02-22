class CicadasController < ApplicationController
  before_action :set_cicada, only: [:show, :edit, :update, :destroy]

  # GET /cicadas
  # GET /cicadas.json
  def index
    @cicadas = Cicada.all
  end

  # GET /cicadas/1
  # GET /cicadas/1.json
  def show
  end

  # GET /cicadas/new
  def new
    @cicada = Cicada.new
  end

  # GET /cicadas/1/edit
  def edit
  end

  # POST /cicadas
  # POST /cicadas.json
  def create
    @cicada = Cicada.new(cicada_params)

    respond_to do |format|
      if @cicada.save
        format.html { redirect_to @cicada, notice: 'Cicada was successfully created.' }
        format.json { render :show, status: :created, location: @cicada }
      else
        format.html { render :new }
        format.json { render json: @cicada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cicadas/1
  # PATCH/PUT /cicadas/1.json
  def update
    respond_to do |format|
      if @cicada.update(cicada_params)
        format.html { redirect_to @cicada, notice: 'Cicada was successfully updated.' }
        format.json { render :show, status: :ok, location: @cicada }
      else
        format.html { render :edit }
        format.json { render json: @cicada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cicadas/1
  # DELETE /cicadas/1.json
  def destroy
    @cicada.destroy
    respond_to do |format|
      format.html { redirect_to cicadas_url, notice: 'Cicada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cicada
      @cicada = Cicada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cicada_params
      params.require(:cicada).permit(:title, :description, :address, :latitude, :longitude)
    end
end
