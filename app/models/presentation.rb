class Presentation < ApplicationRecord
    has_many :evaluations
    has_many :teams
    has_many :users, through: :teams
    validates :grade, :numericality => { :greater_than_or_equal_to => 0 }
end
