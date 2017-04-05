class AuthorPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @author = model
  end

  def edit?
    @current_account == @author.account
  end

  def update?
    @current_account == @author.account
  end

end