module PunditHelper
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :account_not_authorized
  end

  private

  def account_not_authorized
    respond_to do |format|
      format.html {
        redirect_to request.referrer || papers_url, notice: "Access denied."
      }
      format.json {render json: {"redirect":true, "redirect_url": papers_url}}
    end
  end

end

ApplicationController.send :include, PunditHelper