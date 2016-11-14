class Idea < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy

  has_many :liked_by_users, through: :likes, source: :user

  has_many :members, dependent: :destroy

  has_many :memberships, through: :members, source: :user
  # @idea.membership should give us a list of users
  # in idea and want to list the user that are members

  # has_many :user
  # ideas liked by users

  validates :title, presence: true
  validates :body, presence: true

  def like_for(user)
    likes.find_by(user: user)
  end


  # check this method on the idea object, checking the method of one idea has to be the method of idea
  # each idea has a table of likes look for the user passed and look for the list, calls likes find the user
  def membership_for(user)
    members.find_by(user: user)
    # inside idea = table of members, members find look for idea members see if any user_id you passed in. find it means it joined and will pass member entry back
    # user = user_id
  end




end
