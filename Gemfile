source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '~> 4.2'
gem 'bcrypt'

gem 'haml-rails'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass', '~> 3.3'
gem 'simple_form'
gem 'bootsy'
gem 'jquery-rails'
gem 'turbolinks'

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'simplecov', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :production, :development do
  gem 'uglifier', '>= 1.3.0'
end

group :production do
  gem 'rails_12factor' # for heroku
  gem 'pg'
  gem 'unicorn'
  gem 'carrierwave'
  gem 'fog', '1.23.0'
end
