class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.integer :score
      t.text :evaluation
      t.boolean :submitted

      t.timestamps
    end
  end
end
