class AddUserIdToChallenges < ActiveRecord::Migration
  def change
    add_reference :challenges, :user, index: true, foreign_key: true
  end
end
