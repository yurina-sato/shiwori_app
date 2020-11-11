class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :schedules, dependent: :destroy
  has_many :events, through: :schedules, dependent: :destroy # scheduleを経由してeventをhas_mamy
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists, dependent: :destroy # listを経由してitemをhas_mamy

  with_options presence: true do
    validates :name, :text, :destination, :start_day, :finish_day
  end

  validate :date_before_start
  validate :start_end_check

  def date_before_start # 開始日は今日以降の日付
    return if start_day.blank? # 空かどうかを判定

    errors.add(:start_day, 'は今日以降の日付を選択してください') if start_day < Date.today
  end

  def start_end_check # 日付の前後をチェック
    return if finish_day.blank? || start_day.blank? # 空かどうかを判定

    errors.add(:finish_day, 'の日付を正しく記入して下さい') unless start_day < finish_day
  end
end
