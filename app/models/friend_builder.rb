class FriendBuilder

  def build_friends(current_user)
    fs = FacebookService.new(current_user)
    # friends_hash = fs.friends
    friends = fs.friends.first[1]
    friends.map do |friend|



      friend_as_user = User.find_by(uid: friend[:id])
      if User.find_by(uid: friend[:id])
        current_user.friendships.first_or_create(:friend_id => friend_as_user[:id])
      else
        "You Have No Friends"
      end
    end
  end

end
