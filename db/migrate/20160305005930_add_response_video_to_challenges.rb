class AddResponseVideoToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :response_video, :string
  end
end
