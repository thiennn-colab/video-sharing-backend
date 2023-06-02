require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VideoSharingBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.session_store :cookie_store, key: '246a8efdb06fb9c1e8be3ebb55ca47b3'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
    Dir["#{Rails.root}/app/services/*.rb"].each { |file| require file }
    config.action_cable.allowed_request_origins = [
      'http://ec2-18-141-25-185.ap-southeast-1.compute.amazonaws.com'
    ]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
