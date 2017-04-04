class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  def pundit_user
    current_account
  end
  # GET /conferences
  # GET /conferences.json
  def index
    authorize Conference
    @conferences = policy_scope(Conference)

    @conferences = Conference.all
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
    authorize @conference
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
    authorize @conference
  end

  # GET /conferences/1/edit
  def edit
    authorize @conference
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)
    authorize @conference
    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render :show, status: :created, location: @conference }
      else
        format.html { render :new }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    authorize @conference
    respond_to do |format|
      if @conference.update(conference_params)
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference }
      else
        format.html { render :edit }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    authorize @conference
    @conference = Conference.find(params[:id])
    @Conference.papers.each do |paper| 
      if(paper.conference == @Conference)
        paper.destroy
      end
   end
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to conferences_url, notice: 'Conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:name)
    end
end
