#!/bin/bash

gem install bundler --no-rdoc --no-ri --conservative
bundle install
echo "start tests !!"
bundle exec rspec
rspec test/functional/real_user_test.rb
