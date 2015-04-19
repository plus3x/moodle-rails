require 'capybara/cucumber'
require 'capybara/rspec'

if ENV['SELENIUM_DRIVER']
  browser = (ENV['BROWSER'] || :safari).to_sym

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: browser)
  end

  Capybara.default_driver = :selenium
end

# Capybara.javascript_driver = :webkit
