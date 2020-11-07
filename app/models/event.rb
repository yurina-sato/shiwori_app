class Event < ApplicationRecord
  belongs_to :schedule
  has_many_attached :images, dependent: :destroy

  with_options presence: true do
    validates :name, :day, :start_time, :finish_time
  end

  validate :time_check
   # validate :date_before_start # 旅行後のアルバムとして、日付のバリデーションは無しとする

  # def date_before_start # 開始日は今日以降の日付
  #   return if day.blank? # 空かどうかを判定
  #   errors.add(:day, "は今日以降の日付を選択してください") if self.day < Date.today
  # end

  def time_check # 時刻の前後をチェック
    return if finish_time.blank? || start_time.blank? # 空かどうかを判定
    errors.add(:finish_time, "の時刻を正しく記入して下さい") unless self.start_time < self.finish_time
  end 

end
