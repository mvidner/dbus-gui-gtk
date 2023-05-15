# frozen_string_literal: true

# -*-ruby -*-

source "https://rubygems.org"

# Installing without this group as a first step
# allows for better caching of container builds
gem "ruby-dbus", "~> 0.22.0", group: :fast_changing

gem "gtk3", "~> 4.1.2"
gem "nokogiri", "~> 1.14"

group :development do
  gem "rake", ">= 13", "< 999"
  gem "rubocop", "= 1.14.0"
  gem "yard", ">= 0.9", "< 999"
end
