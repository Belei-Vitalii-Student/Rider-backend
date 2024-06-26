require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RiderApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.eager_load_paths << Rails.root.join('lib')

    config.generators { |g| g.orm :mongoid }
    config.mongoid.logger.level = Logger::INFO
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # origins "/.*\.ngrok-free\.app/" "http://localhost:5173"
        origins "https://d3b7-91-243-13-154.ngrok-free.app", "http://localhost:5173"
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
        end
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
