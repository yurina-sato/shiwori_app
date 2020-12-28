class Event < ApplicationRecord
  before_save :set_the_day_implement

  belongs_to :schedule
  has_many_attached :images, dependent: :destroy

  with_options presence: true do
    validates :name, :day, :start_time, :finish_time
  end

  validate :time_check
  # validate :date_before_start # 旅行後のアルバム活用のために、日付のバリデーションは無し

  # def date_before_start # 開始日は今日以降の日付
  #   return if day.blank? # 空かどうかを判定
  #   errors.add(:day, "は今日以降の日付を選択してください") if self.day < Date.today
  # end

  def time_check # 時刻の前後をチェック
    return if finish_time.blank? || start_time.blank? # 空かどうかを判定

    errors.add(:finish_time, 'の時刻を正しく記入して下さい') unless start_time < finish_time
  end

  # new時のタイムゾーン対策(デフォルトではLMTになってしまい時間がズレるので、dayの日付を持ってくる)
  def set_the_day_implement
    year = self.day.year
    month = self.day.month
    day = self.day.day
    
    self.start_time = self.start_time.change(year: year, month: month, day: day)
    self.finish_time = self.finish_time.change(year: year, month: month, day: day)
  
  end
end



