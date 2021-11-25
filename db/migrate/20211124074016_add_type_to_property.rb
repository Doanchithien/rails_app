class AddTypeToProperty < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :type, null: false, foreign_key: true
  end
end
