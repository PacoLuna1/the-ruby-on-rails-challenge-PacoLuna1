# frozen_string_literal: true

# List model
class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  def self.to_csv
    attributes = %w[title]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |list|
        csv << list.attributes.values_at(*attributes)
      end
    end
  end
end
