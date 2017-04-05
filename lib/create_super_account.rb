SuperAccount.transaction do
  SuperAccount.delete_all
  SuperAccount.create( :name => 'super' )
end

Account.transaction do
  Account.create( :email => 'super@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => SuperAccount.first())
end