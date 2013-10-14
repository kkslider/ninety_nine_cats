Cat.create!({ :name => "Monday", :age => 1, :birth_date => "01/01/1990", :color => "red", :sex => "M", :user_id => 1})
Cat.create!({ :name => "Tuesday", :age => 2, :birth_date => "02/02/1990", :color => "orange", :sex => "F", :user_id => 2})
Cat.create!({ :name => "Wednesday", :age => 3, :birth_date => "03/03/1990", :color => "yellow", :sex => "M", :user_id => 3})

CatRentalRequest.create!({ :cat_id => 1, :start_date => "01/01/2000", :end_date => "30/01/2000" })
CatRentalRequest.create!({ :cat_id => 1, :start_date => "15/02/2000", :end_date => "23/02/2000" })
CatRentalRequest.create!({ :cat_id => 1, :start_date => "16/02/2000", :end_date => "18/02/2000" })
CatRentalRequest.create!({ :cat_id => 1, :start_date => "01/02/2000", :end_date => "28/02/2000" })
CatRentalRequest.create!({ :cat_id => 2, :start_date => "01/03/2000", :end_date => "30/03/2000" })

user1 = User.new({ :user_name => "bob1" })
user1.password = "bob1"
user1.save!

user2 = User.new({ :user_name => "bob2" })
user2.password = "bob2"
user2.save!

user3 = User.new({ :user_name => "bob3" })
user3.password = "bob3"
user3.save!
