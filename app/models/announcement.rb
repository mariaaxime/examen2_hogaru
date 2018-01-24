class Announcement < ApplicationRecord
  belongs_to :user
  has_many :seen_announcements
end
