source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "bootsnap", require: false
gem "pg"
gem "puma"
gem "rails"

gem "twilio-ruby"

group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
end

group :test do
  gem "shoulda-matchers"
  gem "webmock"
end
