class Family < ActiveRecord::Base
  has_many :albums

  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
end
