require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Johnsonators
  class Application < Rails::Application

    config.filter_parameters += [:password, :password_confirmation]

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.woff *.svg *.eot *.ttf *.otf)

  end
end
