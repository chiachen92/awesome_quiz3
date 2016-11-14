class Like < ApplicationRecord
  belongs_to :user
  belongs_to :idea



  # if you have an idea and user you can call this method to see if the user is in the likes table for the idea. checks to seee if the user likes the idea


end
