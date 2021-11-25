class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :value
      t.integer :in_stock

      t.timestamps
    end
  end
end
