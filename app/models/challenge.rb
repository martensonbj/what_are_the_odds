class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  enum status: %w(pending completed accepted declined activated dead)

  validates :title, presence: true
  validates :message, presence: true
  validates :assigned_user, presence: true

  def challenge_completed?
    self.response_video?
  end

  def both_guesses_submitted?
    self.challenger_guess && self.challengee_guess
  end

  def challenge_activated?
    self.both_guesses_submitted? && self.guesses_match?
  end

  def challengee_accepted?
    self.challengee_guess && !self.challenger_guess
  end

  def guesses_match?
    self.both_guesses_submitted? && (self.challenger_guess == self.challengee_guess)
  end

  def guesses_dont_match?
    self.both_guesses_submitted? && (self.challenger_guess != self.challengee_guess)
  end

end
