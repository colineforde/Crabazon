require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

require_relative '../app/workers/postman'

module Shoppe
  class Application < Rails::Application
    config.generators.helper = false
    config.active_record.raise_in_transactional_callbacks = true
  end
end
