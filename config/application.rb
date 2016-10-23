require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogForVolt
  class Application < Rails::Application
    require './lib/json_web_token.rb'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    #config.api_only = true
    #config.autoload_paths << Rails.root.join('lib')
    config.time_zone = 'Moscow'
    config.active_job.queue_adapter = :sidekiq
    config.action_mailer.delivery_method   = :postmark
    config.action_mailer.postmark_settings = { api_token: ENV['POSTMARK_API_TOKEN'] }
  end
end
