	source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'rename'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'paperclip', '~> 5.1'
gem 'geocoder', '~> 1.4', '>= 1.4.3'
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_flat_skin'
gem 'omniauth-facebook', '~> 4.0'
gem 'paperclip', '~> 5.1'
gem 'ransack', '~> 1.7'
gem 'active_skin'
gem 'i18n', '~> 0.7.0'
gem 'omniauth'
gem 'font-awesome-rails', '~> 4.6', '>= 4.6.3.1'



group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
