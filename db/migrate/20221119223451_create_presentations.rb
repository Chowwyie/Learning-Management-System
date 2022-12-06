# frozen_string_literal: true

class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.string :name
      t.boolean :submitted, default: false
      t.decimal :grade
      t.datetime :duedate
      t.integer :pointvalue

      t.timestamps
    end
  end
end
