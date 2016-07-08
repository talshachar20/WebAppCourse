#!/bin/bash

gem install bundler --no-rdoc --no-ri --conservative
gem install mysql2 -v '0.3.21'
bundle install
echo "start test !!"
bundle exec rspec
