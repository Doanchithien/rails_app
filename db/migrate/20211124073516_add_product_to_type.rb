class AddProductToType < ActiveRecord::Migration[6.1]
  def change
    add_reference :types, :product, foreign_key: true
  end
end
