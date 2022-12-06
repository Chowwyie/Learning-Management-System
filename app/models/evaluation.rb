# frozen_string_literal: true

##
# Validations for Evaluation model
class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :presentation
  validates :presentation, presence: true
  validates :score, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
