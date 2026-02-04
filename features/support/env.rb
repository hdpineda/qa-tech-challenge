require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'

# Configuración del Driver (Chrome)
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Configuraciones Globales
Capybara.default_driver = :selenium
Capybara.app_host = 'https://demo.applitools.com' # URL Base
Capybara.default_max_wait_time = 10 # Espera hasta 10s si algo no aparece
Capybara.javascript_driver = :selenium