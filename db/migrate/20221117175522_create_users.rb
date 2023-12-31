# frozen_string_literal: true

##
# Create User model
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
