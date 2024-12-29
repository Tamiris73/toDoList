class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user 
  validates :description, presence: true
  validates :completed, inclusion: { in: [ true, false ] }
end
