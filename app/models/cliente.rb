class Cliente < ApplicationRecord
  validates :nome, :email, :senha, :usuario, :descricao, presence: {message: "Campo deve ser preenchido corretamente"}
  validates :nome, length: {maximum: 100, message: "ultrapassou limite de caracteres"}
  validates :descricao, length: {maximum: 200, message: "ultrapassou limite de caracteres"}
  validates :usuario, length: {maximum: 15, message: "ultrapassou limite de caracteres"}
  validates :senha, length: {in: 6..12, message: "Deve ter de 6 a 12 caracteres"}
end
