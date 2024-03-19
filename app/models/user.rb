class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 , minimum:6},
            format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || password_digest_changed? }

  attr_accessor :password_reset_token, :password_reset_token_expires_at

    def generate_reset_token
      self.reset_token = SecureRandom.urlsafe_base64
      self.reset_token_sent_at = Time.zone.now
      save!
    end


  end

