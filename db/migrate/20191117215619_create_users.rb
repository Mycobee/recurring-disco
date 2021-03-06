class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :role, default: 0
      t.boolean :recurring, default: false

      t.timestamps
    end
  end
end
