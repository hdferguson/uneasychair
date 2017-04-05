class UserPolicy
    attr_reader :current_account, :model
  
    def initialize(current_account, model)
      @current_account = current_account
     @User = model
    end
  
    def edit?
     @current_account == @User.account
    end
  
    def update?

     @current_account == @User.account
    end
  
end