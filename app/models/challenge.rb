class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :headshot_photos, :as => :capturable
  enum status: %w(pending completed accepted declined activated dead)

  validates :title, presence: true
  validates :message, presence: true
  validates :assigned_user, presence: true
  has_attached_file :image_upload
  do_not_validate_attachment_file_type :image_upload

  def both_guesses_submitted?
    (self.challenger_guess && self.challengee_guess) ? true : false
  end

  def challenge_activated?
    (self.both_guesses_submitted? && self.guesses_match?) ? true : false
  end

  def guesses_match?
    (self.challenger_guess == self.challengee_guess) ? true : false
  end

  def challenge_accepted?
    (self.challengee_guess && !self.challenger_guess) ? true : false
  end

  def self.get_sent_challenges(current_user)
    (self.all.where(user_id: current_user.id))
  end

  def self.get_pending_challenges(current_user)
    (self.all.where(assigned_user: current_user.id.to_s))
  end

  def set_challenge_image(image_path)
    self.update_attributes(challenge_video: image_path)
  end

  def set_response_image(image_path)
    binding.pry
    self.update_attributes(response_video: image_path)
  end

  def get_friends(current_user)
    fb = FriendBuilder.new
    fb.build_friends(current_user)
  end

end
