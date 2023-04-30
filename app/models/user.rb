class User < ApplicationRecord
  has_many :hostings, class_name: "Event"
  validates_associated :hostings
  # maybe the correct form is validates_associated :events

  has_many :invitations
  has_many :appearances, through: :invitations, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
