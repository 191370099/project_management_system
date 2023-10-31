class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :task_type, null: false, limit: 1
      t.integer :task_status, null: false, limit: 1
      t.integer :priority, null: false, limit: 2
      t.belongs_to :project
      t.belongs_to :developer
      t.timestamps
    end
  end
end
