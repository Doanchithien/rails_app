class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password
      t.date :birthday
      t.integer :phone, unique: true

      t.timestamps
    end
  end
end
