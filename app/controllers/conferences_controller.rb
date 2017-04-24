class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  # GET /conferences
  # GET /conferences.json
  def index
    @state = false
    @conferences = Conference.all

    respond_to do |format|
      format.html {
          if (params[:spa] && params[:spa] == "true")
              render 'index_spa'
          # the else case below is by default
          # else
          #    render 'index'
          end
      }
      format.json {render json: @products}
    end
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end
  
  def showid
    authenticate_account!
    @conferences = Conference.all
  end

  # GET /conferences/new
  def new
    authenticate_account!
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
    authenticate_account!
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)
    @conference.chairid = current_account.id
    @conference.approved = false
    respond_to do |format|
      if @conference.save
        format.html { redirect_to new_conference_committee_path(@conference), notice: 'Conference was successfully created.' }
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
    @conference = Conference.find(params[:id])
   @Conference.committees.each do |committee| 
      if(committee.conference == @Conference)
        committee.destroy
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
