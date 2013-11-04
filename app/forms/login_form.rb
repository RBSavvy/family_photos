class LoginForm < BaseForm
  attribute :email, String
  attribute :password, String
  attribute :user, User

  validates :email, presence: true
  validates :password, presence: true
  validates :user, presence: { message: 'credentials are invalid.' }

  def authenticate
    self.user = User.authenticate_email(email, password)
  end
end
