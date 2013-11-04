class User < ActiveRecord::Base
  include Authentication

  has_many :family_users
  has_many :families, through: :family_users
  has_many :albums, through: :families


end
