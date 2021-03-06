class User < ActiveRecord::Base
  before_save { self.name = name.downcase }
  before_create :create_remember_token

  validates :name, presence: true,length:{maximum:30},uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :pos,presence: true
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
