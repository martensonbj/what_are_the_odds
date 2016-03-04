class AddColumnsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :challenger_guess, :integer
    add_column :challenges, :challengee_guess, :integer
    add_column :challenges, :odds, :integer
  end
end
