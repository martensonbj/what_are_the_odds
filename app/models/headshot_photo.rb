class HeadshotPhoto < ActiveRecord::Base

  belongs_to :capturable, :polymorphic => true

  has_attached_file :image_upload, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default_user_icon_profile.png"

  do_not_validate_attachment_file_type :image_upload
end
