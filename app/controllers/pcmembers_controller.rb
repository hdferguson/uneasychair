class PcmembersController < ApplicationController
  before_action :set_pcmember, only: [:edit, :update]

  
  def edit
  end

 
  def update
    respond_to do |format|
      if @pcmember.update(pcmember_params)
        format.html { redirect_to papers_path, notice: "The profile of the pcmember #{@pcmember.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pcmember.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pcmember
      @pcmember = Pcmember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pcmember_params
      params.require(:pcmember).permit(:name, :email)
    end
end