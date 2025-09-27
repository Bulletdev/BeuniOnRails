class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :cnpj, null: false
      t.string :email
      t.string :phone
      t.text :address
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :organizations, :cnpj, unique: true
    add_index :organizations, :name
  end
end