User.transaction do
  User.delete_all
  User.create( :name => 'Chris')
  User.create( :name => 'Heather')
  User.create( :name => 'Dustin')
  User.create( :name => 'Jason')
  User.create( :name => 'Steph')
  User.create( :name => 'Matthew')
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
  Account.create( :email => 'steph@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => User.find_by_name("Steph"))
  Account.create( :email => 'matthew@group.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => User.find_by_name("Matthew"))
end