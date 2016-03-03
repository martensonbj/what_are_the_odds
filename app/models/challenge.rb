class Challenge < ActiveRecord::Base
  belongs_to :user
  helper_method :user_has_pending_challenges
  enum status: %w(pending, completed, declined)

  private user_has_pending_challenges
    my_challenges = Challenge.where(assigned_user: current_user.id)
    my_challenges.any? do |challenge|
      challenge.status == "pending"
    end
  end

end
