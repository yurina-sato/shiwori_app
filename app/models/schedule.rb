class Schedule < ApplicationRecord
  belongs_to :trip
  has_many :events, dependent: :destroy

  with_options presence: true do
    validates :name, :text, :day
  end

  validate :date_before_start

  def date_before_start # 日付は今日以降
    return if day.blank? # 空かどうかを判定
    errors.add(:day, "は今日以降の日付を選択してください") if self.day < Date.today
  end

end
