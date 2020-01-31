require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Polybility
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    # デフォルトの言語設定
    config.i18n.default_locale = :ja
    # 言語ファイルを階層ごとに設定するための記述
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # アプリケーションが対応している言語のホワイトリスト(ja = 日本語, en = 英語 zh = 簡體中文 zc = 繁體中文)
    config.i18n.available_locales = %i(ja en zh zc)
    # 上記の対応言語以外の言語が指定された場合、エラーとするかの設定
    config.i18n.enforce_available_locales = true

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.generators do |g|
     g.test_framework :rspec,
       fixtures: true,
       view_specs: false,
       helper_specs: false,
       routing_specs: false,
       controller_specs: false,
       request_specs: false
     g.fixture_replacement :factory_bot, dir: "spec/factories"
   end

   config.action_view.field_error_proc = Proc.new do |html_tag, instance|
     html_tag
   end




    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
