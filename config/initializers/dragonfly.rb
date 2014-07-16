require 'dragonfly'

Dragonfly.app.configure do
  # Allow all URLs to be fetched.
  fetch_url_whitelist [
    /.*/
  ]

  plugin :imagemagick

  verify_urls true
  secret Rails.application.secrets.dragonfly_secret

  url_format "/media/:job/:name"

  if Rails.env.test?
    datastore :memory
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveRecord::Base.extend Dragonfly::Model
ActiveRecord::Base.extend Dragonfly::Model::Validations
