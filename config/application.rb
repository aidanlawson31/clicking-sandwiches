require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ClickingSandwiches
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    #User is created before the business, however a user belongs_to a business.
    #belongs_to_required_by_default = false fixes that.
    config.active_record.belongs_to_required_by_default = false
  end
end
