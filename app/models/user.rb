class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trip_users
  has_many :trips, through: :trip_users

  with_options presence: true do
    validates :nickname
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 英数混合の正規表現
  validates :password, format: { with: PASSWORD_REGEX, message: 'は英字と数字を両方含んでください' }, on: :create
end
