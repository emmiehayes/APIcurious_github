# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods


  config.before(:suite) do
   DatabaseCleaner.clean_with(:truncation)
   DatabaseCleaner.strategy = :truncation
  end

   config.around(:each) do |example|
     DatabaseCleaner.cleaning do
       example.run
     end
   end

   Shoulda::Matchers.configure do |config|
     config.integrate do |with|
       with.test_framework :rspec
       with.library :rails
     end
   end

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  def stub_omniauth
    OmniAuth.config.test_mode = true
    omniauth_hash = {'provider' => 'github','uid' => '8312280','info' => {'name' => 'Emmie Hayes','email' => 'emmiehayes2@gmail.com','image' => 'https://avatars3.githubusercontent.com/u/8312280?v=4'}, 'credentials' => {'token' => ENV['test_token']}}
    OmniAuth.config.add_mock(:github, omniauth_hash)
  end

end
