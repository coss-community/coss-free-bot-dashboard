# frozen_string_literal: true

class BotStat
  def call(bot, stat)
    loop do
      trades = Trade.all
      trade_processor = TradeProcessor.new(bot.exchange, stat)
      bot.logger.info("Processing #{trades.size} Trades")

      trades.each do |trade|
        trade_processor.call(trade)
        sleep(1)
      end
      sleep(10)
    end
  end
end
