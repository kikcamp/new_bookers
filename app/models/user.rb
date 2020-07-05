class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, presence: true
    validates :encrypted_password, presence: true # TODO
    validates :name, presence: true, length: { in: 2..20 }
    validates :introduction, presence: true, length: { maximum: 50 }
end