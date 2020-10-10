class CreateComentarios < ActiveRecord::Migration[6.0]
  def change
    create_table :comentarios do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.string :descricao
      t.belongs_to :cliente, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
