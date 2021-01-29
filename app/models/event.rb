class Event < ApplicationRecord

  belongs_to :user
  
  with_options presence: true do
    validates :title
    validates :body
    validates :limit_date
  end
  validate :limit_now

  private

  def limit_now
    return unless limit_date

    if now >= limit_date
      error.add(:limit_date,"は今より後に設定してください")
    end
  end

end
