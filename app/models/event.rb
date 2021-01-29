class Event < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :body
    validates :start_at,:end_at
  end
  validate :start_at_should_be_end_at

  private

  def start_at_should_be_end_at
    return unless start_at && end_at

    if start_at >= end_at
      error.add(:start_at,"は終了時間より前に設定してください")
    end
  end

end
