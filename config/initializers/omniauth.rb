opts = { scope: 'user,repo' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['github_client_id'], ENV['github_client_secret'], scope: "user,repo"
end