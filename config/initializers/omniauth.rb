Rails.application.config.middleware.use OmniAuth::Builder do
opts = { scope: 'user:email' }
  provider :github, Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret, opts
end

