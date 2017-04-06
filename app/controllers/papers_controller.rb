class PapersController < ApplicationController
  before_action :authenticate_account!
  def index
    @papers = Paper.all
  end

  def new
     @paper = Paper.new
  end
  
  def accept
    @paper = Paper.find_by_id(params[:id])
    respond_to do |format|
      @paper.update_attribute(:accepted, @paper.accepted = true)
      format.html { redirect_to @paper.conference }
    end
  end
  
  def show
    @paper = Paper.find(params[:id])
  end
  
  def showid
    @papers = Paper.all
  end

  def create
  @paper = Paper.new(paper_params)
  @paper.authorid = current_account.id
  @paper.accepted = false

    if @paper.save
      redirect_to @paper.conference, notice: "The paper #{@paper.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
   @paper = Paper.find(params[:id])
   @paper.reviews.each do |review| 
      if(review.paper == @paper)
        review.destroy
      end
   end
    @paper.destroy
    redirect_to papers_path, notice:  "The paper #{@paper.title} has been deleted."
  end
  
  private
  def paper_params
    params.require(:paper).permit(:title, :author, :attachment, :conference_id, :authorid, :accepted)
  end
end
