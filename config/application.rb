require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Weblog
  class Application < Rails::Application
    config.active_job.queue_adapter = :delayed_job
    config.load_defaults 5.1
    ActionMailer::Base.smtp_settings = {
      address: "smtp.gmail.com",
      domain: "mail.google.com",
      port: 587,
      user_name: "tieuhodo96@gmail.com",
      password: "zoxg vcmk bdwp jbeb",
      authentication: "login",
      enable_starttls_auto: true
        }
  end
end
