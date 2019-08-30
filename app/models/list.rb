# frozen_string_literal: true

# List model
class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
