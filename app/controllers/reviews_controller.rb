class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end
  
  def showid
    @reviews = Review.all
  end

  # GET /reviews/new
  def new
    @paper = Paper.find_by_id(params[:paper_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.memberid = current_account.id
    @state = false
      if @review.save
         @paper = @review.paper
         @rate = 0.0
        @top = 0.0
        @bottem = 0.0
            @paper.reviews.each do |review| 
              @top += review.score * review.confidence
              @bottem += review.confidence
              end
            @rate = @top / @bottem
        @paper.committee.tracks.each do |track| 
        if( track.userid == current_account.id && track.role == "PC Member" )
          @state = true
        end
        end
        if(@state)
          respond_to do |format|
          @paper.update_attribute(:rating, @paper.rating = @rate)
          format.html { redirect_to @review, notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
          end
        else
        @review.destroy
        redirect_to @paper.committee.conference, notice: "You are not an PC member of that committee. Review not created."
        end
      else
        respond_to do |format|
        format.html { render :new}
        format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        @paper = @review.paper
         @rate = 0.0
        @top = 0.0
        @bottem = 0.0
            @paper.reviews.each do |review| 
              @top += review.score * review.confidence
              @bottem += review.confidence
              end
            @rate = @top / @bottem
            @paper.update_attribute(:rating, @paper.rating = @rate)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
    
    def prate(id)
       @paper = Paper.find_by_id(params[:id])
    @rate = 0.0
    @top = 0.0
    @bottem = 0.0
    if(@paper.reviews.count >= 3)
      @paper.reviews.each do |review| 
        @top += review.score * review.confidence
        @bottem += review.confidence
      end
      @rate = @top / @bottem
    end
      @paper.update_attribute(:rating, @paper.rating = @rate)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:score, :confidence, :comments, :paper_id)
    end
end
