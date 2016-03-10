class FriendBuilder

  def build_friends(current_user)
    fs = FacebookService.new(current_user)
    friends = fs.friends.first[1]

    friends.map do |friend|
      friend_as_user = User.find_by(uid: friend[:id])

      if friend_as_user
        current_user.friendships.where(friend_id: friend_as_user[:id]).first_or_create
      else
        "You Have No Friends"
      end
    end
  end

end
