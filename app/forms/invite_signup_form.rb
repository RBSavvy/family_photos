class InviteSignupForm < BaseForm
  attribute :name, String
  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String
  attribute :user, User
  attribute :invite_code, String

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :user, presence: { message: 'credentials are invalid.' }

  validate do
    user.valid?
    user.errors.each do |err|
      self.errors.add err
    end
  end

  def submit
    self.user = User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
  end
end
