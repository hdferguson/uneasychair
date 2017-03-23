class PcchairsController < ApplicationController
  before_action :set_pcchair, only: [:edit, :update]

 
  def edit
  end


  def update
    respond_to do |format|
      if @pcchair.update(pcchairhair_params)
        format.html { redirect_to papers_path, notice: "The profile of the pcchair #{@pcchair.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pcchair.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pcchair
      @pcchair = Pcchair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pcchair_params
      params.require(:pcchair).permit(:name, :email)
    end
end