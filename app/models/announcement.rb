# frozen_string_literal: true

class Announcement < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  validates :user, presence: true
end
