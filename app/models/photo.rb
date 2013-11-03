class Photo < ActiveRecord::Base

  # Associations
  belongs_to :album


  # Uploaders
  mount_uploader :image, PhotoUploader


  # Callbacks
  before_create do
    self.description ||= File.basename(image.filename, '.*').titleize if image
  end

end
