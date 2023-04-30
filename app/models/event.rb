class Event < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "user_id"

  has_many :invitations
  has_many :guests, through: :invitations, source: :user
end
