class MidiasController < ApplicationController
  before_action :set_midia, only: [:show, :edit, :update, :destroy]

  # GET /midias
  # GET /midias.json
  def index
    @midias = Midia.all
  end

  # GET /midias/1
  # GET /midias/1.json
  def show
  end

  # GET /midias/new
  def new
    @midia = Midia.new
  end

  # GET /midias/1/edit
  def edit
  end

  # POST /midias
  # POST /midias.json
  def create
    @midia = Midia.new(midia_params)

    respond_to do |format|
      if @midia.save
        format.html { redirect_to @midia, notice: 'Midia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @midia }
      else
        format.html { render action: 'new' }
        format.json { render json: @midia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /midias/1
  # PATCH/PUT /midias/1.json
  def update
    respond_to do |format|
      if @midia.update(midia_params)
        format.html { redirect_to @midia, notice: 'Midia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @midia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /midias/1
  # DELETE /midias/1.json
  def destroy
    @midia.destroy
    respond_to do |format|
      format.html { redirect_to midias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_midia
      @midia = Midia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def midia_params
      params.require(:midia).permit(:email, :senha, :nome, :login, :data_criacao, :email_admin)
    end
end
