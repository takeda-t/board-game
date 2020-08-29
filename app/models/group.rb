class Group < ApplicationRecord
  
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :schedule, presence: true
  validates :place, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :category, presence: true, length: { maximum: 50 }
  
  has_many :group_users
  has_many :accept, through: :group_users, source: :user
end
