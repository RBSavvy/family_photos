class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  before_create do
    self.description ||= File.basename(image.filename, '.*').titleize if image
  end

end
