class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: {message: "já cadastrado"}
  validates :username, length: {maximum: 15, message: "ultrapassou limite de caracteres"},uniqueness: {message: "já cadastrado"}
  validates :password, length: {in: 6..12, message: "Deve ter de 6 a 12 caracteres"}
end
