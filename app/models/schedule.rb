class Schedule < ApplicationRecord
  belongs_to :trip

  with_options presence: true do
    validates :name, :text
  end

end
