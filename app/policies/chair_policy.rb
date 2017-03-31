class ChairPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @Chair = model
  end

  def edit?
    @current_account == @Chair.account
  end

  def update?
    @current_account == @Chair.account
  end

end