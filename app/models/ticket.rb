class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :comments, dependent: :destroy
  enum :status, { open: 0, in_progress: 1, resolved: 2, closed: 3 }, default: :open
  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }, default: :medium
end