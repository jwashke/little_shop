# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :spotify, ENV['SPOTIFY_KEY'], ENV['SPOTIFY_SECRET']
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
