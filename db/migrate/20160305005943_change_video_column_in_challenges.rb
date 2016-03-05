class ChangeVideoColumnInChallenges < ActiveRecord::Migration
  def change
    rename_column :challenges, :video, :challenge_video
  end
end
