class CreateGiftShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :gift_shipments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :gift_campaign, null: false, foreign_key: true
      t.date :scheduled_date
      t.date :sent_date
      t.date :delivered_date
      t.string :status, default: 'scheduled'
      t.string :tracking_code
      t.text :notes

      t.timestamps
    end

    add_index :gift_shipments, :status
    add_index :gift_shipments, :scheduled_date
    add_index :gift_shipments, [:employee_id, :scheduled_date]
  end
end