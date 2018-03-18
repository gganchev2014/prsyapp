class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]

  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }

  def self.create_from_provider_data(provider_data)
    email = self.where(email: provider_data.info.email)
    if email.exists?
      user = email.first
      user.provider = provider_data.provider
      user.uid = provider_data.uid
    else
      user = self.create do |user|
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0, 20]
        user.skip_confirmation!
      end
    end
    user
  end

  protected

  def confirmation_required?
   false
  end
end
