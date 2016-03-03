class FriendBuilder

  def build_friends(current_user)
    fs = FacebookService.new(current_user)
    friends_hash = fs.friends
    friends = friends_hash.first[1]
    friend_list = friends.map do |friend|
      friend_as_user = User.find_by(uid: friend[:id])
      if friend_as_user
        current_user.friendships.first_or_create(:friend_id => friend_as_user[:id])
      else
        "You Have No Friends"
      end
    end
  end

end
