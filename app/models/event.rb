class Event < ApplicationRecord
  validates :place, :day, presence: true
  belongs_to :host, class_name: "User", foreign_key: "user_id"

  has_many :invitations
  has_many :guests, through: :invitations, source: :user
end
