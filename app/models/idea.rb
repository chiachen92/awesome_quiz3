class Idea < ApplicationRecord

  belongs_to :user
  has_many :likes

  has_many :liked_by_users, through: :likes, source: :user

  # ideas liked by users

  validates :title, presence: true
  validates :body, presence: true

  def like_for(user)
    likes.find_by(user: user)
  end
  # check this method on the idea object, checking the method of one idea has to be the method of idea
  # each idea has a table of likes look for the user passed and look for the list, calls likes find the user




end
