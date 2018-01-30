class RemoveSeenAnnouncements < ActiveRecord::Migration[5.1]
  def change
    drop_table :seen_announcements
  end
end
