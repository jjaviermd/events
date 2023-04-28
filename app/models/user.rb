class User < ApplicationRecord
  has_many :hostings, inverse_of: :host, class_name: "Event"

  has_many :invitations
  has_many :appearances, through: :invitations, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
