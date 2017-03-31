class ChairsController < ApplicationController
  before_action :set_chair, only: [:edit, :update]

  def pundit_user
     current_account
  end
  
  def edit
    authorize @chair
  end

  
  def update
    authorize @chair
    respond_to do |format|
      if @chair.update(chair_params)
        format.html { redirect_to papers_path, notice: "The profile of the chair #{@chair.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chair.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chair
      @chair = Chair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chair_params
      params.require(:chair).permit(:name, :email)
    end
end