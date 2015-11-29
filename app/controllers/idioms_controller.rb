class IdiomsController < ApplicationController
  before_action :set_idiom, only: [:destroy]

  # GET /media/idioms
  # GET /media/idioms.json
  def index
  end

  # GET /media/idioms/1
  # GET /media/idioms/1.json
  def show
  end

  # GET /media/idioms/new
  def new
    @idiom = Idiom.new
  end

  # GET /media/idioms/1/edit
  def edit
  end

  # POST /media/idioms
  # POST /media/idioms.json
  def create
    @idiom = Idiom.new(idiom_params)
    @idiom.id_midia = params[:id_midia]

    respond_to do |format|
      if @idiom.save
        format.html { redirect_to '/media', notice: 'Idiom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medium }
      else
        format.html { render action: 'new' }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/idioms/1
  # PATCH/PUT /media/idioms/1.json
  def update
  end

  # DELETE /media/idioms/1
  # DELETE /media/idioms/1.json
  def destroy
    Idiom.where(id: @idiom[:id]).delete_all
    respond_to do |format|
      format.html { redirect_to '/media' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idiom
      @idiom = Idiom.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def idiom_params
       params.require(:idiom).permit(:idioma, :id_midia)
     end
end
