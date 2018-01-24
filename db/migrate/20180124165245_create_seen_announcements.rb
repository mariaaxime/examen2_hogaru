class CreateSeenAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :seen_announcements do |t|
      t.boolean :seen

      t.timestamps
    end
  end
end
