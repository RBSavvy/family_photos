module Authentication
  extend ActiveSupport::Concern

  included do
    attr_reader   :password
    attr_accessor :password_confirmation

    validates :password, confirmation: true, length: {minimum: 5, allow_blank: true}
    validates :password_confirmation, presence: true, if: "password.present?"
  end

  # Sets password
  def password= password
    @password = password
    self.password_salt = authentication_random_token
    self.crypted_password = BCrypt::Password.create(password + self.password_salt, cost: 10)
  end

  # Checks if crypted password matches user entered password
  def password_matches? password
    BCrypt::Password.new(self.crypted_password) == password + self.password_salt
  end

  # Reset password without saving to database
  def reset_password
    token = authentication_random_token
    self.password = token
    self.password_confirmation = token
  end

  # Resets password and forces save
  def reset_password!
    reset_password.tap { save! }
  end

  module ClassMethods
    def authenticate_email email, password
      user = User.where(email: email).first
      user if user.present? && user.password_matches?(password)
    end

    def authenticate_email! email, password
      authenticate_email(email, password) || raise(ActiveRecord::RecordNotFound, 'Could not authenticate with those email credentials.')
    end
  end

  private
  def authentication_random_token
    ::SecureRandom.base64(15).tr('+/=', '').strip.delete("\n")
  end
end
