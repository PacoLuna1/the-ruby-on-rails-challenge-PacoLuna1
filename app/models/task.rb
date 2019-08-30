# frozen_string_literal: true

# Task model
class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true,
                    length: { minimum: 5 }
end
