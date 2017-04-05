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
    @track = Track.new
    @tracks = Track.all
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @tracks = Track.all
    @track = Track.new(track_params)
    @track.userid = current_account.id
    @track.capproved = false
    @track.uapproved = false
    respond_to do |format|
      @state=true
        @tracks.each do |track| 
        if(track.conference == @track.conference && track.userid == @track.userid && track != @track)
          @track.destroy
          @state =false
          format.html { redirect_to tracks_path, notice: 'Track not created. Only one track per user per conference.' }
          format.json { render :show, status: :created, location: @track }
          break
        end
      if @track.save && @state
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
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
      params.require(:track).permit(:role, :conference_id, :user_id)
    end
end
