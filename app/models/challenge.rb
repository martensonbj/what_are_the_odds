class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  enum status: %w(pending completed accepted declined activated dead)

  validates :title, presence: true
  validates :message, presence: true
  validates :assigned_user, presence: true

  has_many :headshot_photos, :as => :capturable

  has_attached_file :image_upload
  do_not_validate_attachment_file_type :image_upload

  def both_guesses_submitted?
    self.challenger_guess && self.challengee_guess
  end

  def challenge_activated?
    self.both_guesses_submitted? && self.guesses_match?
  end

  def challengee_accepted?
    self.challengee_guess && !self.challenger_guess
  end

end
