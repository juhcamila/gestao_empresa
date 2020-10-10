class Post < ApplicationRecord
  validates :descricao, length: {maximum: 255, message: 'Não pode ultrapassar 255 caracteres'}
  validates :assunto, length: {maximum: 100, message: 'Não pode ultrapassar 100 caracteres'}

  belongs_to :user
  belongs_to :cliente
  has_many :comentarios
end