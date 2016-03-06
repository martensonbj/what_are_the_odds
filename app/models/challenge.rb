class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  enum status: %w(pending completed accepted declined)

  validates :title, presence: true
  validates :message, presence: true
  validates :assigned_user, presence: true


end
