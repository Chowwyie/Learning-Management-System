# frozen_string_literal: true

##
# Validations for Team join table model
class Team < ApplicationRecord
  belongs_to :user
  belongs_to :presentation
  validates :presentation, presence: true
  validates :user, presence: true
end
