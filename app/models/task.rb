class Task < ApplicationRecord
  enum task_type: { bug: 0, feature: 1 }
  enum task_status: { assigned: 0, completed: 1 }
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  belongs_to :project
  belongs_to :developer
  # before_save :check_availability

  private

  def check_availability
    return unless developer
    return unless developer.tasks.where(task_status: 0).any?

    errors.add(:developer_id, 'Developer is already assigned to another task')
    throw(:abort)
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description developer_id id name priority project_id task_status task_type
       updated_at]
  end
end
