class Task < ApplicationRecord
  enum task_type: { bug: 0, feature: 1 }
  enum task_status: { pending: 0, assigned: 1, completed: 2 }
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  belongs_to :project
  belongs_to :developer
  # before_save :check_availability

  private

  def check_availability
    if (task_status.assigned && developer.present?)
      if developer.tasks.size > 0
        errors.add(:name, 'Developer is not availabe!')
      end
    end
  end
end
