class User < ActiveRecord::Base
    
    has_many :posts
    has_many :comments
    has_many :likes
#this code helps us talk to the user table in our database
#needs to be capital! but the file needs to be all lowercase?
#this lets us define a class which we can make objects from?
    validates_presence_of :email, :avatar_url, :username, :password
    validates_uniqueness_of :email, :username


end