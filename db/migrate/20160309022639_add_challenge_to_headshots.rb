class AddChallengeToHeadshots < ActiveRecord::Migration
  def change
    add_reference :headshot_photos, :challenge, index: true, foreign_key: true
  end
end
