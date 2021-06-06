class User < ApplicationRecord
  validates :title, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :introduction, presence: true, length: { maximum: 100 }
end
