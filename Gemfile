# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'active_model_serializers', '0.10.10'
gem 'bootsnap', '1.4.6', require: false
gem 'pg', '1.2.2'
gem 'puma', '4.3.3'
gem 'rack-cors', '1.1.1'
gem 'rails', '6.0.2.1'
gem 'rubocop', require: false

group :development, :test do
  gem 'pry', '0.12.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
