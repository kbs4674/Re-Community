require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KNU_Community
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.serve_static_assets = true
    config.i18n.default_locale = :ko
    config.time_zone = 'Seoul'
  end
end

# 저작권 보호 / Copyright 문구
# 해당 자료는 아직 Beta Test가 진행중인 프로젝트 자료입니다.
# kbs4674@naver.com, kbs4674@likelion.org, blog.naver.com/kbs4674, README.md 에 적힌 팀원 외에는 자료 무단 유출 사용을 불허합니다.