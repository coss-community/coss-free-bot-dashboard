# frozen_string_literal: true

require 'open-uri'

class ApplicationController < ActionController::Base
  def stats
    @stat = Stat.instance
    @random_user = JSON.parse(open(URI("https://randomuser.me/api/?seed=#{BotSeed.new.call}&inc=name,picture")).read)
    @bot_name = [@random_user['results'].first['name']['first'].titleize, @random_user['results'].first['name']['last'].titleize].join(' ')
    @l_currency = Rails.application.secrets[:pair].split('_').first
    @r_currency = Rails.application.secrets[:pair].split('_').last
    @status = begin
                JSON.parse(@stat.last_trade_status)
              rescue StandardError
                { 'status' => 666, 'message' => 'Unknown Error' }
              end
    @status_name = @status['status'].to_s == '200' ? 'ok' : 'err'
    render('/stats')
  end
end
