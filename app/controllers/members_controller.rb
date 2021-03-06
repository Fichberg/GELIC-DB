class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    member = Member.find(params[:id])
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @member.email_admin = @current_user.email
    @member.data_criacao = Time.new

    respond_to do |format|
      if !member_params[:email].empty? && !member_params[:senha].empty? && !member_params[:senha_confirmation].empty? && !member_params[:nome].empty? && !member_params[:login].empty?
        if @member.save
          if @member.is_super
            (Admin.new(:email => @member.email)).save
          end
          format.html { redirect_to @member, notice: 'Member was successfully created.' }
          format.json { render action: 'show', status: :created, location: @member }
        end
      end
      format.html { render action: 'new' }
      format.json { render json: @member.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @member.email_admin = @current_user.email

    respond_to do |format|
      if !member_params[:email].empty? && !member_params[:senha].empty? && !member_params[:senha_confirmation].empty? && !member_params[:nome].empty? && !member_params[:login].empty?
        if @member.update(member_params)
          format.html { redirect_to @member, notice: 'Member was successfully updated.' }
          format.json { head :no_content }
        end
      end
      format.html { render action: 'edit' }
      format.json { render json: @member.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    ok = true

    if @member.is_super
      all_members = Member.all
      all_members.each do |m|
        if m.email_admin.eql?(@member.email)
          ok = false
          break
        end
      end
    end

    if ok
      @member.destroy
      respond_to do |format|
        format.html { redirect_to members_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to members_url, notice: 'Was unable to delete this user: other users depend on it (admin email field). Update these users first.' }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:email, :senha, :senha_confirmation, :nome, :login, :data_criacao, :is_super, :email_admin)
    end
end
