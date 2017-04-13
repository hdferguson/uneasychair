User.transaction do
  User.delete_all
  User.create( :name => 'Chris')
  User.create( :name => 'Heather')
  User.create( :name => 'Dustin')
  User.create( :name => 'Jason')
end

Account.transaction do
  Account.create( :email => 'chris@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => User.find_by_name("Chris"))
  Account.create( :email => 'heather@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => User.find_by_name("Heather"))
  Account.create( :email => 'dustin@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => User.find_by_name("Dustin"))
  Account.create( :email => 'jason@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => User.find_by_name("Jason"))
end