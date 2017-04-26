class CommitteesController < ApplicationController
  before_action :set_committee, only: [:show, :edit, :update, :destroy]

  # GET /committees
  # GET /committees.json
  def index
    @committees = Committee.all
  end

  # GET /committees/1
  # GET /committees/1.json
  def show
  end
  
  def showid
    @committees = Committee.all
  end

  def members
    @committee = Committee.find_by_id(params[:id])
  
  end
  # GET /committees/new
  def new
    @conference = Conference.find_by_id(params[:conference_id])
    @committee = Committee.new
  end

  # GET /committees/1/edit
  def edit
  end

  # POST /committees
  # POST /committees.json
  def create
    @committee = Committee.new(committee_params)
    
    
      if @committee.save
        @conference = @committee.conference
        if @conference.chairid != current_account.id
          @committee.destroy
          redirect_to @conference, notice: "You are not the chair of this conference."
        else if @conference.chairid == @committee.user.id
          @committee.destroy
          redirect_to @conference, notice: "You can't make yourself a PC chair in your own conference."
        else
          respond_to do |format|
          format.html { redirect_to @committee, notice: 'Committee was successfully created.' }
          format.json { render :show, status: :created, location: @committee }
          end
        end
        end
      else
        respond_to do |format|
        format.html { render :new }
        format.json { render json: @committee.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /committees/1
  # PATCH/PUT /committees/1.json
  def update
    respond_to do |format|
      if @committee.update(committee_params)
        format.html { redirect_to @committee, notice: 'Committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee }
      else
        format.html { render :edit }
        format.json { render json: @committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committees/1
  # DELETE /committees/1.json
  def destroy
    @committee.papers.each do |paper| 
        paper.destroy
   end
   @committee.tracks.each do |track| 
        track.destroy
   end
    @committee.destroy
    respond_to do |format|
      format.html { redirect_to conferences_path, notice: 'Committee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee
      @committee = Committee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_params
      params.require(:committee).permit(:name, :user_id, :conference_id)
    end
end