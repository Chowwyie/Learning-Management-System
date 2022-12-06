# frozen_string_literal: true

##
# Create Team join table from presentation <-> user
class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams, &:timestamps
  end
end
