class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
    validates :limit_date
  end
  validate :limit_now

  private

  # def limit_now
    # return unless limit_date

    # error.add(:limit_date 'は今より後に設定してください') if Time.zone.now >= limit_date
  # end
end
