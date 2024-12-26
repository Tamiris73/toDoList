class Task < ApplicationRecord
  belongs_to :list

  validates :description, presence: true
  validates :completed, inclusion: { in: [ true, false ] }
end
