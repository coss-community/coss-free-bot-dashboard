web: bundle exec puma -C config/puma.rb
worker: bundle exec rails runner 'Bot.new.call' -e $RACK_ENV
