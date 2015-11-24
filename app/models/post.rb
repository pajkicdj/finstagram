class Post < ActiveRecord::Base
   
   belongs_to :user
   has_many :comments
   has_many :likes
   
   
   
   def humanized_time_ago
       time_ago_in_seconds = Time.now - self.created_at #the Time has a method called now = for the exact time right now. everything we created has a method called created_at
       time_ago_in_minutes = time_ago_in_seconds / 60  #the self = talks to it's own vales at the instance you are looking at it.
       time_in_days = (time_ago_in_minutes / 60) / 24
       
       if time_in_days >= 1
           "#{(time_in_days).to_i}d"
       elsif time_ago_in_minutes >= 60
           "#{(time_ago_in_minutes / 60).to_i}h"
       elsif time_ago_in_minutes < 60 && time_ago_in_minutes >= 1
           "#{(time_ago_in_minutes).to_i}m"
       else
           "#{(time_ago_in_seconds).to_i}s"
       end
   end
   
   def like_count
       self.likes.size
   end
   
   def comment_count
       self.comments.size
   end
   
   validates_presence_of :photo_url, :user
end