source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', :group => :development
gem 'pg', :group => :production
gem 'rails_12factor', :group => :production
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Sunspot : 검색엔진 (development 용)
  #gem 'rails_db'
  gem 'sunspot_solr'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# rails_db, i18n
gem 'devise-i18n'

# Gem : 부트스트랩 관련
gem 'jquery-rails'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'sprockets-rails', :require => 'sprockets/railtie'

# devise
gem 'devise', git: 'https://github.com/plataformatec/devise.git'

# Gem : 목록 페이징 기능
gem 'kaminari'

# Gem : 게시판 에디터 (TinyMCE)
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
gem 'tinymce-rails-imageupload', '~> 4.0.0.beta'
gem 'carrierwave'
gem 'fog'

# Gem : 조회수
gem 'impressionist'

# Gem : 권한 관리
gem 'cancancan'
gem 'rolify'

# Gem : 게시판 삭제 기록 관리
gem "paranoia", "~> 2.2"

# Gem : 코드보안
gem 'figaro'

# Gem : 투표
gem 'acts_as_votable', '~> 0.11.1'

# Gem : 알림을 위한 메시지 잼
gem 'unread'

# Gem : 대댓글 가능한 댓글잼
gem 'acts_as_commentable_with_threading'

# Gem : Rails_admin (어드민 페이지)
gem 'rails_admin', '~> 1.2'

# Gem : 검색엔진(Sunspot)
gem 'sunspot_rails'

# Gem : 자동기능 수행(자동삭제 관련 때문에 필요.)
gem 'whenever', require: false

# Gem : PostgreSQL DB 백업
gem 'backup', '~> 5.0.0.beta.2'

# Gem : 외부 로그인(네이버)
gem 'omniauth'
gem 'omniauth-naver'
gem 'omniauth-kakao', :git => 'git://github.com/hcn1519/omniauth-kakao'

# Gem : OpenAPI
gem 'unirest'