class CountriesController < ApplicationController
  before_action :set_country, only: [:destroy]

  # GET /media/countries
  # GET /media/countries.json
  def index
  end

  # GET /media/countries/1
  # GET /media/countries/1.json
  def show
  end

  # GET /media/countries/new
  def new
    @country = Country.new
  end

  # GET /media/countries/1/edit
  def edit
  end

  # POST /media/countries
  # POST /media/countries.json
  def create
    @country = Country.new(country_params)
    @country.id_midia = params[:id_midia]

    puts "AQUI"
    p params[:tipo].nil?

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render action: 'show', status: :created, location: @country }
      else
        format.html { render action: 'new' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/countries/1
  # PATCH/PUT /media/countries/1.json
  def update
  end

  # DELETE /media/countries/1
  # DELETE /media/countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def country_params
       params.require(:country).permit(:countrya, :id_midia)
     end
end
