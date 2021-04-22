class Task < ApplicationRecord
  belongs_to :user, optional: true
  with_options presence: true do
    validates :task_title
    validates :complete

  
  # validates :limit_now

  # def limit_now
    # return if limit_date.blank?
    # errors.add(:limit_date, 'は今より後に設定してください') if Time.now > limit_date
  # end
end
