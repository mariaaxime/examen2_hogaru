class CreateSeenAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :seen_announcements do |t|
      t.boolean :seen
      t.references :user, foreign_key: true
      t.references :announcement, foreign_key: true

      t.timestamps
    end
  end
end
