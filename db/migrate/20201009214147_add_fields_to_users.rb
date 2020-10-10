class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_reference :users, :clientes, null: false, foreign_key: true
    add_column :users, :manager, :boolean
  end
end
