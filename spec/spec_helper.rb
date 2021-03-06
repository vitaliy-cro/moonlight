ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'capybara/rspec'
require 'capybara/rails'
require 'database_cleaner'
require 'factory_girl_rails'
require 'helpers'
require 'rails_helper'
require 'sidekiq/testing'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers


  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    Sidekiq::Worker.clear_all
  end

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end
