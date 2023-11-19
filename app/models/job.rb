class Job < ApplicationRecord

  JOB_VALID_STATUSES = ['waiting', 'done', 'in progress', 'failed'].freeze
  JOB_VALID_PRIORITIES = ['critical', 'high', 'medium', 'low'].freeze

  # Validations
  validates :title, presence: true

  # Define allowed values for status
  validates :status, presence: true, inclusion: { in: JOB_VALID_STATUSES }

  # Define allowed values for priority
  validates :priority, presence: true, inclusion: { in: JOB_VALID_PRIORITIES }
end
