class PapersController < ApplicationController
  def index
    @papers = Paper.all
  end

  def new
     @paper = Paper.new
  end

  def create
  @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to papers_path, notice: "The paper #{@paper.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
   @paper = Paper.find(params[:id])
    @paper.destroy
    redirect_to papers_path, notice:  "The paper #{@paper.title} has been deleted."
  end
  
  private
  def paper_params
    params.require(:paper).permit(:title, :author:, :attachment)
  end
end
