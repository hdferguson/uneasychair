class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  @roles = ["Author", "PC Chair", "PC Member", "Chair"]

  # GET /tracks
  # GET /tracks.json
  def pundit_user
    current_account
  end
  
  def index
    @tracks = Track.all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @conference = Conference.find_by_id(params[:conference_id])
    @track = Track.new
    @tracks = Track.all
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)
    @track.userid = current_account.id
    @track.capproved = false
    @track.uapproved = false
    @tracks = Track.all
          
      if @track.save
        @state =true
        if @track.conference != @track.committee.conference
           @track.destroy
           @state =false
          redirect_to @track.conference, notice: "The committee and conference are not compatible. Let's just pretend this didn't happen."
        else if @track.conference.chairid == current_account.id
          @track.destroy
          @state =false
          redirect_to @track.conference, notice: "You are already the chair of this conference."
        else if @track.committee.user.id == current_account.id
          @track.destroy
          @state =false
          redirect_to @track.conference, notice: "You are already a PC chair of this committee."
        else
        @tracks.each do |track| 
          if(track.committee == @track.committee && track.userid == @track.userid && track != @track)
            @track.destroy
            @state =false
            redirect_to tracks_path, notice: 'Track not created. Only one track per user per conference.' 
            break
          end
        end
        end
        end
        end
        if(@state)
          respond_to do |format|
          format.html { render :index, notice: 'Track was successfully created.' }
          format.json { render :show, status: :created, location: @track }
          end
        end
      else
        respond_to do |format|
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    @temp = @track.committee
    respond_to do |format|
      if @track.update(track_params)
          format.html { redirect_to @track, notice: 'Track was successfully updated.' }
          format.json { render :show, status: :ok, location: @track }
        else
          @track.committee = @temp
          format.html { render :edit, notice: 'You are the PC Chair of this conference.' }
          format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.committee.papers.each do |paper| 
      if(paper.authorid == @track.userid)
        paper.destroy
      else
      paper.reviews.each do |review|
        if(review.memberid == @track.userid)
          review.destroy
        end
      end
      end
   end
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:role, :conference_id, :committee_id, :userid, :capproved, :uapproved)
    end
end
