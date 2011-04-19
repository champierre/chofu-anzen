#!/usr/bin/env ruby

def _run(cmd)
  puts cmd
  system cmd
end

_run 'gem install bundler --no-rdoc --no-ri'
_run 'bundle install'
_run 'rake db:migrate'
print 'Input App Name:'
app_name = STDIN.gets
app_name.chop!
print 'Input Access Secret:'
access_secret = STDIN.gets
access_secret.chop!
print 'Input Access Token:'
access_token = STDIN.gets
access_token.chop!
print 'Input Consumer Secret:'
consumer_secret = STDIN.gets
consumer_secret.chop!
print 'Input Consumer Token:'
consumer_token = STDIN.gets
consumer_token.chop!
_run "heroku create #{app_name}"
_run "git remote add heroku git@heroku.com:#{app_name}.git"
_run "heroku addons:add cloudmailin:test"
