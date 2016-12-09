class User < ApplicationRecord

  has_secure_password

  has_many :members, dependent: :destroy

  has_many :ideas, dependent: :destroy

  has_many :like, dependent: :destroy

  has_many :liked_ideas, through: :likes, source: :idea

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

end
