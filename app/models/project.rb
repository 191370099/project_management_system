class Project < ApplicationRecord
  has_many :tasks
  belongs_to :manager
  before_validation :due_date_must_valid

  private

  def due_date_must_valid
    return unless due_date.present? && due_date <= Date.current

    errors.add(:due_date, 'must be in the future')
  end
end
