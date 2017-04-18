require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HighConceptor
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.use OmniAuth::Builder do
  		provider :github, 'f3f5ab3b7e7695efeada', '6518513539e78b5c8e1a155a74782a811ec38856'
		end
  end
end
