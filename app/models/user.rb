class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2,
    too_short: "es demasiado corto, el mínimo es %{count} caracteres" }
  validates :last_name, presence: true, length: { minimum: 2 ,
    too_short: "es demasiado corto, el mínimo es %{count} caracteres" }
  validates :phone, presence: true, length: { minimum: 7,
    too_short: "es demasiado corto, el mínimo es %{count} caracteres" }
  validates :birthdate, presence: true
end
