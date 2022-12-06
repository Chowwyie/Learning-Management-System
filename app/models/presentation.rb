class Presentation < ApplicationRecord
    has_many :evaluations
    has_many :teams
    has_many :users, through: :teams
    validates :name, presence: true, length: { maximum: 50 }
    validates :grade, :numericality => { :greater_than_or_equal_to => 0, less_than_or_equal_to: 100}, if: :grade
end
