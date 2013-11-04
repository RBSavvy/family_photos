module Inviteable
  extend ActiveSupport::Concern

  INVITE_KEY = 'e0f4da9832b9075e04b546062e9faefe'
  INVITE_CIPHER = "des-ede3-cbc"

  module ClassMethods
    def find_by_invite_code code
      des = OpenSSL::Cipher::Cipher.new(INVITE_CIPHER)
      des.decrypt
      des.key = INVITE_KEY
      decoded = Base64.decode64(URI.unescape(code))
      des.iv = decoded.slice!(0,8)
      id = (des.update(decoded) + des.final).to_i
      self.find(id)
    end
  end

  def invite_code
    des = OpenSSL::Cipher::Cipher.new(INVITE_CIPHER)
    des.encrypt
    des.key = INVITE_KEY
    des.iv = iv = SecureRandom.hex(4)

    data = des.update(self.id.to_s) + des.final
    base64_data = Base64.encode64(iv + data)
    URI.escape(base64_data, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end
end