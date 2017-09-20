class User < ApplicationRecord
    #attr_accessor :password
    # attr_accessor :name, :email, :password, :password_confirmation
    has_many :quizzes
    
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

        validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
        validates :email, presence: true, length: { maximum: 100 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
        has_secure_password
        validates :password, presence: true, length: { minimum: 6 }

        def User.digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                          BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
        end

        def self.from_omniauth(auth)
            where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
              user.provider = auth.provider
              user.uid = auth.uid
              user.name = auth.info.name
              user.oauth_token = auth.credentials.token
              user.oauth_expires_at = Time.at(auth.credentials.expires_at)
              user.save!
            end
          end
    
end
