class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_title, null: false
      t.text :task_body, null: true
      t.datetime :target_at, null: true
      t.datetime :completed_at, null: true
      t.boolean :completed, null: false, default: false
      t.references :user, foreign_key: true
      t.references :event
      t.timestamps

    end
  end
end
