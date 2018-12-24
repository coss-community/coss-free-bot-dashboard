class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.decimal :profit_gained, null: false, default: 0
      t.decimal :volume_produced, null: false, default: 0

      t.decimal :fees_paid_left, null: false, default: 0
      t.decimal :fees_paid_right, null: false, default: 0
      t.decimal :fees_paid_cft, null: false, default: 0


      t.integer :trades_completed, null: false, default: 0
      t.text :last_trade_status
      t.timestamps
    end
  end
end
