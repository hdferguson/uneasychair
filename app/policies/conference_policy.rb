class ConferencePolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @conference = model
  end

  def index?
    current_account.accountable_type == "User"
  end

  def show?
    @current_account == @conference.user.account
  end

  def new?
    current_account.accountable_type == "User"
  end

  def create?
    current_account.accountable_type == "User"
  end

  def edit?
    @current_account == @conference.user.account
  end

   def update?
    @current_account == @confernce.user.account
  end

  def destroy?
    @current_account == @conference.user.account
  end

  class Scope < Struct.new(:current_account, :model)
    def resolve
        model.where(user: current_account.accountable)
    end
  end

end