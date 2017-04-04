class PapersController < ApplicationController
 before_action :authenticate_account!
 def pundit_user
    current_account
  end
 
  def index
   


    authorize Paper 
    @papers = policy_scope(Paper)
    @papers = Paper.all
  end

  def new
     @paper = Paper.new
     authorize @paper
  end
  
  def show
    authorize @paper 
    @paper = Paper.find(params[:id])
  end

  def edit
    authorize @paper
  end

  def create
  @paper = Paper.new(paper_params)
  authorize @paper
    if @paper.save
      redirect_to papers_path, notice: "The paper #{@paper.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
   authorize @paper
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
    params.require(:paper).permit(:title, :author, :attachment, :conference_id)
  end
end
