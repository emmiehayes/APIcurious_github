class User < ApplicationRecord

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end
end

# The function first_or_initialize.tap returns the User object if it finds one, 
# updates the user if any of the information has changed, or creates and saves a new one if the user didn’t exist at all