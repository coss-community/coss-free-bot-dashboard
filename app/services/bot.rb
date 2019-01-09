# frozen_string_literal: true

class Bot
  attr_reader :bot

  def initialize
    secrets = Rails.application.secrets
    @bot = case secrets.bot_strategy.to_s.upcase
           when 'BEAR'
             CossBot::SellHighBuyLow.new(public_key: secrets[:public_key], private_key: secrets[:private_key])
           when 'BULL'
             CossBot::BuyLowSellHigh.new(public_key: secrets[:public_key], private_key: secrets[:private_key])
           else
             raise ArgumentError, 'Unknown Bot Strategy'
           end
    bot.interval = secrets[:interval]
    bot.lot_size = secrets[:lot_size]
    bot.profit = secrets[:profit]
    bot.pair = secrets[:pair]
    bot.trade_limit = secrets[:trade_limit]
    bot.logger = Rails.logger
  end

  def call
    stat = Stat.instance
    Thread.new { BotStat.new.call(bot, stat) }
    bot.call do |buy_order, sell_order, error|
      Trade.create!(buy_order_id: buy_order['order_id'], sell_order_id: sell_order['order_id']) if error.blank?
      res = error.presence || { status: 200, message: 'OK' }
      stat.update(last_trade_status: res.to_json, updated_at: Time.zone.now)
    end
  end
end
