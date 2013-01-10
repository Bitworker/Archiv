class Userarchivment < ActiveRecord::Base
  belongs_to :user
  belongs_to :archiv

  mount_uploader :image, ImageUploader
end
