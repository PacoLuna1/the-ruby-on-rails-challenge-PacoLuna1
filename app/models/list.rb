class List < ApplicationRecord
  has_many :tasks
  validates :title, presence: true,
                    length: { minimum: 5 }
end
