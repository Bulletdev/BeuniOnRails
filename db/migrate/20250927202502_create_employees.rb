class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :cpf, null: false
      t.string :email
      t.string :phone
      t.string :position
      t.string :department
      t.date :admission_date
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :employees, [:organization_id, :cpf], unique: true
    add_index :employees, :birth_date
    add_index :employees, :department
    add_index :employees, :active
  end
end