source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '~> 4.2'
gem 'bcrypt'

gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.0'
# gem 'sdoc', '~> 0.4.0', group: :doc

grou :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-rails'
  # gem 'spring-commands-rspec'
  # gem 'spring-commands-cucumber'
end

grou :development do
  # gem 'capistrano-rails'
end

group :production, :development do
  gem 'uglifier', '>= 1.3.0'
  gem 'turbolinks'
  gem 'jquery-rails'
end

group :production do
  # gem 'fog'
  gem 'rails_12factor'
  gem 'pg'
  # gem 'unicorn'
end

