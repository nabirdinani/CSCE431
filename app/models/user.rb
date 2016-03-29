class User < ActiveRecord::Base
	
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	validates :phone,  presence: true, length: { maximum: 15 }
  	VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
  	validates :password, presence: true, length: { minimum: 8 }                    
end
