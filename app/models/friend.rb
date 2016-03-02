class Friend < ActiveRecord::Base
  belongs_to :user

  def initialize(user)
    fs = FacebookService.new(user)
    friends = fs.friends
    generate_friends(friends)
  end

  def generate_friends(friends)
    if friends != nil
      user_friends = friends.map do |friend|
        name = friend[1][0][:name]
        id = User.find_by(uid: friend[1][0][:id]).id
        Friend.create(name: "#{name}", user_id: id)
      end
    else
      ["No Friends"]
    end
  end

end
