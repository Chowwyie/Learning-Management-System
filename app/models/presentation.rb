class Presentation < ApplicationRecord
    has_many :evaluations
    has_many :teams
    has_many :users, through: :teams
    validates :name, presence: true, length: { maximum: 50 }
    validates :duedate, presence: true
    validates :pointvalue, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
