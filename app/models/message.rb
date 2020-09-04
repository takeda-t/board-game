class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  
  validates :content, presence: true, length: { maximum: 255 }
end
