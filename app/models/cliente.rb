class Cliente < ApplicationRecord
  validates :nome, :email, :usuario, :descricao, presence: {message: "Campo deve ser preenchido corretamente"}
  validates :nome, length: {maximum: 100, message: "ultrapassou limite de caracteres"}
  validates :descricao, length: {maximum: 200, message: "ultrapassou limite de caracteres"}
  validates :email, uniqueness: {case_sensitive: false, message: "já cadastrado"}
  validates :usuario, length: {maximum: 15, message: "ultrapassou limite de caracteres"}, uniqueness: {case_sensitive: false, message: "já cadastrado"}
  validates :senha, length: {in: 6..12, message: "Deve ter de 6 a 12 caracteres"}
  validates :senha, presence: true, on: :create
end
