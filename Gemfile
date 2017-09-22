source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.3"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "jquery-ui-rails"

group :development do
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "autoprefixer-rails"
  gem "better_errors"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "guard-rspec", require: false
  gem "jshint"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "railroady"
  gem "reek"
  gem "rspec"
  gem "rspec-collection_matchers"
  gem "rspec-rails"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "simplecov-json"
  gem "simplecov-rcov", require: false
end

gem "bootstrap-sass", "3.3.7"
gem "config"
gem "delayed_job_active_record"
gem "devise"
gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails"
gem "font-awesome-rails"
gem "omniauth"
gem "omniauth-facebook"
gem "rails_best_practices"
gem "scss_lint", require: false
gem "scss_lint_reporter_checkstyle", require: false
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "carrierwave"
gem "cloudinary"
gem "mini_magick"
gem "kaminari"
gem "figaro"
gem "faker"
gem "ckeditor"
