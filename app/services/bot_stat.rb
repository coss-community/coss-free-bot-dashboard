# frozen_string_literal: true

class BotStat
  def call
    exchange = CossApiRubyWrapper::Exchange.new(public_key: Rails.application.secrets[:public_key], private_key: Rails.application.secrets[:private_key])
    stat = Stat.first_or_create
    trade_processor = TradeProcessor.new(exchange, stat)
    Trade.all.each do |trade|
      trade_processor.call(trade)
      sleep(0.5)
    end
  end
end
