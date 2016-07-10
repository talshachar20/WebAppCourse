#!/bin/bash

gem install bundler --no-rdoc --no-ri --conservative
bundle install
echo "start tests !!"
bundle exec rspec
