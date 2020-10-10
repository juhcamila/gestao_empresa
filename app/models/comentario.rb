class Comentario < ApplicationRecord
  belongs_to :post
  belongs_to :cliente
  belongs_to :user
end
