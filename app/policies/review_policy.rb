class ReviewPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @review = model
  end

  def index?
    current_account.accountable_type == "User"
  end

  def show?
    @current_account == @review.user.account
  end

  def new?
    current_account.accountable_type == "User"
  end

  def create?
    current_account.accountable_type == "User"
  end

  def edit?
    @current_account == @review.user.account
  end

   def update?
    @current_account == @review.user.account
  end

  def destroy?
    @current_account == @review.user.account
  end

  class Scope < Struct.new(:current_account, :model)
    def resolve
        model.where(user: current_account.accountable)
    end
  end

end