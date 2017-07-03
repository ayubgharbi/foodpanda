class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
	after_destroy :ensure_an_admin_remains
  
  has_many :authorizations 
  has_many :reviews, dependent: :destroy
  has_many :foods  
  has_many :orders, dependent: :destroy
  has_many :line_items
  has_one :cart
  belongs_to :restaurant
  accepts_nested_attributes_for :restaurant
	
	validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end 
  end  


  # Returns the hash digest of the given string. 
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token 
    SecureRandom.urlsafe_base64
  end 

  def remember 
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest. 
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget 
    update_attribute(:remember_digest, nil)
  end

  	private 
  		def ensure_an_admin_remains 
  			if User.count.zero? 
  				raise Error.new "Cant't delete last user"
  			end
  		end
end
