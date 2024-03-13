class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 , minimum:6},
            format: { with: VALID_EMAIL_REGEX }
<<<<<<< Updated upstream
=======

  validates :password, presence: true, length: { minimum: 6 }

  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    update_attribute(:remember_digest, BCrypt::Password.create(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
>>>>>>> Stashed changes
end
