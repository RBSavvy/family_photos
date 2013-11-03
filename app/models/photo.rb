class Photo < ActiveRecord::Base

  # Associations
  belongs_to :album


  # Uploaders
  mount_uploader :image, PhotoUploader


  # Callbacks
  before_create do
    self.description ||= File.basename(image.filename, '.*').titleize if image
  end


  def cached_image_url
    Rails.cache.fetch [self, 'image_url'], expires_in: 1.week do
      image.url
    end
  end

  def cached_thumb_url
    Rails.cache.fetch [self, 'thumb_url'], expires_in: 1.week do
      image.thumb.url
    end
  end

  def cached_micro_url
    Rails.cache.fetch [self, 'micro_url'], expires_in: 1.week do
      image.micro.url
    end
  end

end
