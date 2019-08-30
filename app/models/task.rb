# frozen_string_literal: true

# Task model
class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true,
                    length: { minimum: 5 }
  def self.to_csv
    attributes = %w{ title details date }
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |task|
        csv << task.attributes.values_at(*attributes)
      end
    end
  end
end
