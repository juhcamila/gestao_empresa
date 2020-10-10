class Post < ApplicationRecord
  validates :descricao, length: {maximum: 255, message: 'Não pode ultrapassar 255 caracteres'}
  validates :assunto, length: {maximum: 100, message: 'Não pode ultrapassar 100 caracteres'}

  belongs_to :user, class_name: "User", foreign_key: "users_id"
  belongs_to :cliente, class_name: "Cliente", foreign_key: "clientes_id"
  has_many :comentarios
end