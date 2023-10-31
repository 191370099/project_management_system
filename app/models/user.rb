class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  # validates :phone, length: { minimum: 3, maximum: 20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
