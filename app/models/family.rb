class Family < ActiveRecord::Base
  include Inviteable

  has_many :albums

  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users


end
