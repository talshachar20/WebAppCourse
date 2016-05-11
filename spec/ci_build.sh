#!/bin/bash

gem install bundler --no-rdoc --no-ri --conservative
bundle install
echo "start test !!"
bundle exec rspec lib/free_script_spec.rb