# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

ruby "3.1.2" # Specify a Ruby version if desired

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use Puma as the app server
gem "puma", "~> 5.0"

# Use JavaScript with importmap-rails
# gem "importmap-rails" # Rails 7 default, often included via rails gem itself
# gem "turbo-rails"
# gem "stimulus-rails"

# Use SCSS for stylesheets
gem "sassc-rails"

# Build JSON APIs with jbuilder
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages
  gem "web-console"
  # Add speed buttons for debugging
  gem "bootsnap", require: false
end

group :test do
  # Use system testing
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
