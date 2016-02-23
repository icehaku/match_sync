require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module MatchSync
  class Application < Rails::Application

    config.assets.precompile += %w( application )

    config.active_record.raise_in_transactional_callbacks = true
  end
end
