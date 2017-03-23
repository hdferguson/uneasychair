class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update]

  def edit
  end


  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to papers_path, notice: "The profile of the author #{@author.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name, :email)
    end
end