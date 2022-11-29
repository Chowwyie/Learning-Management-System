class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.text :text

      t.timestamps
    end
    add_reference :announcements, :user, index: true, foreign_key: true
  end
end
