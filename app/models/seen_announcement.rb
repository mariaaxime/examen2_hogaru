class SeenAnnouncement < ApplicationRecord
  belongs_to :user
  belongs_to :announcement
end
