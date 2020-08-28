class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  #validetes :schedule, presence: true
  validates :place, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :category, presence: true, length: { maximum: 50 }
end
