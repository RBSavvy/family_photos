class User < ActiveRecord::Base
  include Authentication

  has_many :family_users, dependent: :destroy
  has_many :families, through: :family_users
  has_many :albums, through: :families


  def gravatar_url
    if self.email.present?
      hash = Digest::MD5.hexdigest(self.email.strip.downcase)
      "http://www.gravatar.com/avatar/#{hash}"
    end
  end

end
