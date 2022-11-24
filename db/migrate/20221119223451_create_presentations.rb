class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.string :name
      t.boolean :submitted, :default => false
      t.integer :grade
      t.datetime :duedate

      t.timestamps
    end
  end
end
