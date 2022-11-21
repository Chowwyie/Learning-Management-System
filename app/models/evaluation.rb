class Evaluation < ApplicationRecord
    belongs_to :user
    belongs_to :presentation
    has_one :score
end
