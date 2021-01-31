class Task < ApplicationRecord
  belongs_to :user, optional: true
  with_options presence: true do
    validates :task_title
    validates :task_body
  end
end
