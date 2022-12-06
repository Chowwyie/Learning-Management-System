# frozen_string_literal: true

class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.integer :score, default: 0
      t.text :evaluation
      t.boolean :submitted, default: false
      t.datetime :duedate

      t.timestamps
    end
  end
end
