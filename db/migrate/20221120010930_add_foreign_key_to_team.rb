# frozen_string_literal: true

class AddForeignKeyToTeam < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :presentation, index: true, foreign_key: true
    add_reference :teams, :user, index: true, foreign_key: true
  end
end
