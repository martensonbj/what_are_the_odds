class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :assigned_user
      t.datetime :expiration_date
      t.string :message
      t.string :video

      t.timestamps null: false
    end
  end
end
