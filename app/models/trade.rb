# frozen_string_literal: true

class Trade < ApplicationRecord
  validates :buy_order_id, :sell_order_id, presence: true
end
