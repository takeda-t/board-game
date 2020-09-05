class Group < ApplicationRecord
  
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :schedule, presence: true
  validates :place, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :category, presence: true, length: { maximum: 50 }
  
  has_many :group_users
  has_many :accept, through: :group_users, source: :user
  
  has_many :messages
  has_many :group_talk, through: :messages
  
  #検索機能
  scope :search, -> (search_params) do
    return if search_params.blank?
    
    name_like(search_params[:name])
      .schedule_from(search_params[:schedule_from])
      .schedule_to(search_params[:schedule_to])
      .title_like(search_params[:title])
      .category_like(search_params[:category])
  end
  
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%" ) if name.present?}
  scope :schedule_from, -> (from) { where('? <= schedule', from ) if from.present?}
  scope :schedule_to, -> (to) { where('schedule <= ?', to ) if to.present?}
  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%" ) if title.present?}
  scope :category_like, -> (category) { where('category LIKE ?', "%#{category}%" ) if category.present? }
  
end
