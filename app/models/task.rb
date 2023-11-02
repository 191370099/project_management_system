class Task < ApplicationRecord
  enum task_type: { bug: 0, feature: 1 }
  enum task_status: { assigned: 0, completed: 1 }
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  belongs_to :project
  belongs_to :developer
  # before_save :check_availability

  private

  def check_availability
    if self.developer
      if self.developer.tasks.where(task_status: 0).any?
        errors.add(:developer_id, "Developer is already assigned to another task")
        throw(:abort)
      end
    end
  end
end
