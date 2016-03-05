  class User < ActiveRecord::Base
  has_many :challenges
  has_many :friendships
  has_many :friends, :through => :friendships

  validates :uid, uniqueness: true, presence: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :token, presence: true

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    user.name = auth['info']['name']
    user.link = auth['info']['link']
    user.picture = auth['info']['image']
    user.token = auth['credentials']['token']
    # user.build_friends(user)
    user.save
    user
  end

  # ???????????????????
  def build_friends(user)
    fs = FacebookService.new(user)
    friends_hash = fs.friends
    friends = friends_hash.first[1]

    friend_list = friends.collect! do |friend|
      friend_as_user = User.find_by(uid: friend[:id])
      user.friendships.first_or_initialize(:friend_id => friend_as_user[:id])
    end
  end

end
