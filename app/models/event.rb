class Event < ApplicationRecord
  validates :title, length: { maximum: 50}, presence:true
  validates :body, length:{ maximum: 2000}, presence:true
  validates :start_at,:end_at, presence:true
  validates :start_at_should_be_end_at

  private

  def start_at_should_be_end_at
    return unless start_at && end_at

    if start_at >= end_at
      error.add(:start_at,"は終了時間より前に設定してください")
    end
  end

end
