class CreateGiftCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :gift_campaigns do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :default_gift_type
      t.decimal :budget_per_gift, precision: 10, scale: 2
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :gift_campaigns, :active
  end
end