#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# ./bin/rails assets:precompile
# ./bin/rails assets:clean
bundle exec rake assets:precompile
bundle exec rake assets:clean