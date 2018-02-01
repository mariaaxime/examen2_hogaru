class Announcement < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  validates :expiration_date, presence: true
  belongs_to :user
end
