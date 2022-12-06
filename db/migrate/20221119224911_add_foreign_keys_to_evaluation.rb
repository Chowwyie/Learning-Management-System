# frozen_string_literal: true

##
# Add FKs to evaluation model for presentation and evals
class AddForeignKeysToEvaluation < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluations, :presentation, index: true, foreign_key: true
    add_reference :evaluations, :user, index: true, foreign_key: true
  end
end
