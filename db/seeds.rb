user1 = {:first_name => "Frodo", :last_name => "Baggins", :username => "underhill", :email => "baggins@shire.com", :password => "bilbo"}
user2 = {:first_name => "Arwen", :last_name => "Undomiel", :username => "evenstar", :email => "arwen@imladris.com", :password => "aragorn"}

User.create(user1)
User.create(user2)