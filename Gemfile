source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'annotate', '~> 3.1'
gem 'aws-sdk-s3', '~> 1.104'
gem 'bcrypt', '~> 3.1.16'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', '~> 2.7'
gem 'file_validators', '~> 3.0'
gem 'jbuilder', '~> 2.7'
gem 'jwt', '~> 2.3'
gem 'kaminari', '~> 1.2'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem 'rack-attack', '~> 6.5'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'rails-i18n', '~> 6.0'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'
gem 'sentry-rails', '~> 4.7'
gem 'sentry-ruby', '~> 4.7'
gem 'sidekiq', '~> 6.2'
gem 'sidekiq-cron', '~> 1.2'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot', '~> 6.2'
  gem 'faker', '~> 2.19'
  gem 'pronto', '~> 0.11.0'
  gem 'pronto-brakeman', '~> 0.11.0'
  gem 'pronto-fasterer', '~> 0.11.1'
  gem 'pronto-rails_best_practices', '~> 0.11.0'
  gem 'pronto-reek', '~> 0.11.0'
  gem 'pronto-rubocop', '~> 0.11.1'
  gem 'reek', '~> 6.0'
  gem 'rexml', '~> 3.2'
  gem 'rspec-rails', '~> 5.0'
  gem 'rubocop', '~> 1.22'
  gem 'simplecov', '~> 0.21.2'
  gem 'simplecov-cobertura', '~> 1.4'
  gem 'solargraph', '~> 0.44.0'
  gem 'thor', '~> 1.1'
end

group :development do
  gem 'brakeman', '~> 5.1'
  gem 'fasterer', '~> 0.9.0'
  gem 'listen', '~> 3.3'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'database_cleaner', '~> 2.0'
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
