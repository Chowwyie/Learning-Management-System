class Presentation < ApplicationRecord
    has_many :evaluations
    has_many :teams
    has_many :users, through: :teams
    validates :name, presence: true, length: { maximum: 50 }
end
