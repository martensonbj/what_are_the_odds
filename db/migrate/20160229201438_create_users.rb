class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :link
      t.string :picture
      t.string :email
      t.string :phone
      t.string :token

      t.timestamps null: false
    end
  end
end
