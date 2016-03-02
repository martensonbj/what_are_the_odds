class User < ActiveRecord::Base
  has_many :challenges
  has_many :friends

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
    binding.pry
    find_friends(user)

    user.save
    user
  end

  def self.find_friends(user)
    Friend.new(user)
  end
end
