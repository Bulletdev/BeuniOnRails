require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module BeuniGifts
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w[assets tasks])

    config.time_zone = 'Brasilia'

    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = [:'pt-BR', :en]

    config.active_job.queue_adapter = :sidekiq
  end
end