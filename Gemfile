source 'https://rubygems.org'

# Core
gem 'rails', '~> 4.2.4'
gem 'responders', '~> 2.1'
gem 'pg'
gem 'timers'
gem 'exception_notification'
gem 'lograge'

# .env configuration loading
gem 'dotenv'
gem 'dotenv-rails'
gem 'dotenv-deployment'

# Frontend
gem 'sass-rails', '~> 5.0.4'
gem 'uglifier', '~> 2.7.2'
gem 'jquery-rails'
gem 'slim-rails'
gem 'compass-rails', '~> 2.0.5'
gem 'simple_form', '~> 3.2.0'
gem 'slodown', git: 'https://github.com/hmans/slodown'
gem 'font-awesome-rails'
gem 'kaminari'
gem 'microformats2'

# Binary asset handling
gem 'dragonfly'

# Authorization/Authentication
gem 'cancancan'
gem 'bcrypt', '~> 3.1'

# API
gem 'jbuilder', '~> 2.3'

# HTTP interactions
gem 'httparty'
gem 'webmention', git: 'https://github.com/indieweb/mention-client-ruby'

# Development & Testing only
#
group :test, :development do
  # Spring application reloader
  gem 'spring'
  gem 'spring-commands-rspec'

  # Debugging
  gem 'pry-rails'
  gem 'awesome_print'

  # RSpec & friends
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker', '~> 2.1'
end

# Development only.
group :development do
  # Capistrano
  gem 'capistrano-rails', require: false
  gem 'capistrano-chruby', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rbenv', require: false

  # Nicer error messages
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Development only
#
group :development do
  # Log cleanup
  gem 'quiet_assets'
end

# Testing only.
#
group :test do
  gem 'webmock'
end

# Staging & Production only
#
group :staging, :production do
  gem 'puma'
end
