phil = User.where(email: 'phil@philmonroe.com').first_or_initialize.tap do |u|
  u.name = 'Phil Monroe'
  u.password              = 'admin'
  u.password_confirmation = 'admin'
  u.save!
end


if phil.families.blank?
  phil.families.create name: 'Monroe'
end