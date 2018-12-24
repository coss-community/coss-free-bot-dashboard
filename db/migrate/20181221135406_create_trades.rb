class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :buy_order_id, null: false
      t.string :sell_order_id, null: false

      t.timestamps
    end
  end
end
