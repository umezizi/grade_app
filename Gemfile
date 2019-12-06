source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '~> 5.2.3'
gem 'bootstrap', '~> 4.1.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder',     '2.7.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'devise'
gem 'omniauth-twitter'
gem 'aws-ses'
gem 'mini_magick', '~> 4.8'
gem 'asset_sync'
gem 'fog-aws'
gem 'aws-sdk-s3', require: false
gem 'omniauth-rails_csrf_protection'
gem 'kaminari', '1.1.1'
gem 'ransack'
gem 'gmaps4rails'
gem 'geocoder'
gem 'font-awesome-sass', '~> 5.4.1'
gem 'jp_prefecture'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'bullet'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rubocop', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard'
  gem 'guard-rspec', require: false
end
