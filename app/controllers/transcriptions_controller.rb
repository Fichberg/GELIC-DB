class TranscriptionsController < ApplicationController
  before_action :set_transcription, only: [:show, :edit, :update, :destroy]

  # GET /transcriptions
  # GET /transcriptions.json
  def index
    @transcriptions = Transcription.all
    @authors = Author.all
    @reviewers = Reviewer.all
  end

  # GET /transcriptions/1
  # GET /transcriptions/1.json
  def show
  end

  # GET /transcriptions/new
  def new
    @transcription = Transcription.new
  end

  # GET /transcriptions/1/edit
  def edit
  end

  # POST /transcriptions
  # POST /transcriptions.json
  def create
    @transcription = Transcription.new(transcription_params)

    respond_to do |format|
      if !transcription_params[:id_midia].empty? && !transcription_params[:id_cidade].empty? && !transcription_params[:codigo].nil?
        if @transcription.save && (Author.new(:email_membro => @current_user.email, :id_midia => @transcription.id_midia)).save
          format.html { redirect_to @transcription, notice: 'Transcription was successfully created.' }
          format.json { render action: 'show', status: :created, location: @transcription }
        end
      end
      format.html { render action: 'new' }
      format.json { render json: @transcription.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /transcriptions/1
  # PATCH/PUT /transcriptions/1.json
  def update
    respond_to do |format|
      if !transcription_params[:id_midia].empty? && !transcription_params[:id_cidade].empty?
        if @transcription.update(transcription_params)
          format.html { redirect_to @transcription, notice: 'Transcription was successfully updated.' }
          format.json { head :no_content }
        end
      end
      format.html { render action: 'edit' }
      format.json { render json: @transcription.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /transcriptions/1
  # DELETE /transcriptions/1.json
  def destroy
    @author = Author.find_by(id_midia: @transcription.id_midia)
    @reviewers = Reviewer.all

    @reviewers.each do |rvwr|
      if rvwr.id_midia == @transcription.id_midia
        @reviewer = Reviewer.find_by(id_midia: rvwr.id_midia, email_membro: rvwr.email_membro)
        @reviewer.destroy unless @reviewer.nil?
      end
    end

    @author.destroy
    @transcription.destroy
    respond_to do |format|
      format.html { redirect_to transcriptions_url }
      format.json { head :no_content }
    end
  end

  def file
    @transcription = Transcription.find(params[:id])
    content = @transcription.codigo.read
    if stale?(etag: content, last_modified: Date.new, public: true)
      send_data content, type: @transcription.codigo.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  def all
    @medium_reviewers = Reviewer.where(:id_midia => params[:id_midia])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcription
      @transcription = Transcription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcription_params
      params.require(:transcription).permit(:id, :codigo, :comentario, :id_midia, :id_cidade)
    end
end
