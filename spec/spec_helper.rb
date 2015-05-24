require "webmock/rspec"

if ENV["RAILS_ENV"] == "test" && ENV['CODECLIMATE_REPO_TOKEN']
  WebMock.disable_net_connect!(:allow => "codeclimate.com")
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  WebMock.disable_net_connect!(allow_localhost: true)
end


if ENV.fetch("COVERAGE", false)
  require "simplecov"
  SimpleCov.start "rails"
end

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end
