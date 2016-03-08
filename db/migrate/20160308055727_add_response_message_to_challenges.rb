class AddResponseMessageToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :response_message, :string
  end
end
