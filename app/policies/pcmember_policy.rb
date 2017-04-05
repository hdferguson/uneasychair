class PcmemberPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @pcmember = model
  end

  def edit?
    @current_account == @pcmember.account
  end

  def update?
    @current_account == @pcmember.account
  end

end