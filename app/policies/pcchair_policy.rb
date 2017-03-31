class PcchairPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @pcchair = model
  end

  def edit?
    @current_account == @pcchair.account
  end

  def update?
    @current_account == @pcchair.account
  end

end