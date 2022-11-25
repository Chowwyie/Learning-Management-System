class Evaluation < ApplicationRecord
    belongs_to :user
    belongs_to :presentation
    validates :presentation, :presence => true
end
