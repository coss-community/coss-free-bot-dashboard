# frozen_string_literal: true

class Bot
  def call
    secrets = Rails.application.secrets
    bot = CossBot::BuyLowSellHigh.new(public_key: secrets[:public_key], private_key: secrets[:private_key])
    bot.interval = secrets[:interval]
    bot.lot_size = secrets[:lot_size]
    bot.profit = secrets[:profit]
    bot.pair = secrets[:pair]
    bot.trade_limit = secrets[:trade_limit]
    bot.logger = Rails.logger
    stat = Stat.first_or_create
    bot.call do |buy_order, sell_order, error|
      BotStat.new.call
      Trade.create!(buy_order_id: buy_order['order_id'], sell_order_id: sell_order['order_id']) if error.blank?
      res = error.presence || { status: 200, message: 'OK' }
      stat.updated_at = Time.zone.now
      stat.update(last_trade_status: res.to_json)
    end
  end
end
