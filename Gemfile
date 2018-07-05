source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', "~> 1.0"
gem 'devise'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'gritter', '1.2.0'
gem "administrate"
gem 'pundit', '~> 1.1'
gem "font-awesome-rails"
gem 'twilio-ruby', '~> 5.10.3'
gem 'kaminari'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-nav'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.10'
  gem 'dotenv-rails', '~> 2.4'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
