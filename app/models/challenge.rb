class Challenge < ActiveRecord::Base
  belongs_to :user
  enum status: %w(pending, completed, declined)


end
