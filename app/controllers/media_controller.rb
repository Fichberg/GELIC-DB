class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
    @idioms = Idiom.all
  end

  # GET /media/1
  # GET /media/1.json
  def show
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  def create
    time = Time.new

    @medium = Medium.new(medium_params)
    @medium.email_admin = @current_user.email
    
    respond_to do |format|
      if !medium_params[:tipo].empty? && !medium_params[:nome].empty? && !medium_params[:duracao].empty? && !medium_params[:email_coletor].empty? && !medium_params[:id_cidade].nil?
        if @medium.save
          format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
          format.json { render action: 'show', status: :created, location: @medium }
        end
      end
      format.html { render action: 'new' }
      format.json { render json: @medium.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if !medium_params[:tipo].empty? && !medium_params[:nome].empty? && !medium_params[:duracao].empty? && !medium_params[:email_coletor].empty? && !medium_params[:id_cidade].nil?
        if @medium.update(medium_params)
          format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
          format.json { head :no_content }
        end
      end
      format.html { render action: 'edit' }
      format.json { render json: @medium.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:tipo, :nome, :duracao, :email_coletor, :data_gravacao, :data_submissao, :id_cidade)
    end
end
