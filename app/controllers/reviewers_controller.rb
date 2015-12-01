class ReviewersController < ApplicationController
  before_action :set_reviewer, only: [:destroy]

  # GET /transcriptions/1/reviewers
  # GET /transcriptions/1/reviewers.json
  def index
  end

  # GET /transcriptions/1/reviewers/1
  # GET /transcriptions/1/reviewers/1.json
  def show
  end

  # GET /transcriptions/1/reviewers/new
  def new
  end

  # GET /transcriptions/1/reviewers/1/edit
  def edit
  end

  # POST /transcriptions/1/reviewers
  # POST /transcriptions/1/reviewers.json
  def create
    @reviewer = Reviewer.new
    @reviewer.email_membro = @current_user.email
    @reviewer.id_midia = params[:id_midia]

    respond_to do |format|
      if @reviewer.save
        format.html { redirect_to '/transcriptions', notice: 'Reviewer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transcription }
      else
        format.html { render action: 'new' }
        format.json { render json: @transcription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcriptions/1/reviewers/1
  # PATCH/PUT /transcriptions/1/reviewers/1.json
  def update
  end

  # DELETE /transcriptions/1/reviewers/1
  # DELETE /transcriptions/1/reviewers/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewer
      @reviewer = Reviewer.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def reviewer_params
       params.require(:reviewer).permit(:reviewers, :id_midia)
     end
end
