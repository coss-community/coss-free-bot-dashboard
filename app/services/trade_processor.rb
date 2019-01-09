# frozen_string_literal: true

class TradeProcessor
  attr_reader :exchange, :stat

  def initialize(exchange, stat)
    @exchange = exchange
    @stat = stat
  end

  def call(trade)
    buy_order_details = exchange.order_details(trade.buy_order_id)
    sell_order_details = exchange.order_details(trade.sell_order_id)
    return if buy_order_details['status'] != 'filled' ||
              sell_order_details['status'] != 'filled' ||

    buy_details = exchange.trade_detail(trade.buy_order_id)
    sell_details = exchange.trade_detail(trade.sell_order_id)
    return if buy_details.nil? || sell_details.nil?
    stat.reload

    stat.increment(:profit_gained, (sell_details.sum { |o| o['total'].to_f } - buy_details.sum { |o| o['total'].to_f }))
    stat.increment(:volume_produced, (sell_details.sum { |o| o['total'].to_f } + buy_details.sum { |o| o['total'].to_f }))
    if /CFT/.match?(sell_details.first['fee'].to_s)
      stat.increment(:fees_paid_cft, (sell_details.sum { |o| o['fee'].to_f } + buy_details.sum { |o| o['fee'].to_f }))
    else
      stat.increment(:fees_paid_right, (sell_details.sum { |o| o['additional_fee'].to_f } + buy_details.sum { |o| o['additional_fee'].to_f }))
      stat.increment(:fees_paid_left, (sell_details.sum { |o| o['fee'].to_f } + buy_details.sum { |o| o['fee'].to_f }))
    end
    stat.increment(:trades_completed, 1)

    stat.save!(touch: false)
    trade.delete
  end
end
