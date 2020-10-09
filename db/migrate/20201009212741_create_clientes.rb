class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.string :descricao

      t.timestamps
    end
  end
end
