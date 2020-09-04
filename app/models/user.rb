class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 20}
    validates :email, presence:true, length: { maximum: 255},
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false } 
    has_secure_password
    
    has_many :groups
    
    #グループへの参加機能
    has_many :group_users
    has_many :participates, through: :group_users, source: :group
    
    def participate(group)
      unless participate?(group)
        self.group_users.find_or_create_by(group_id: group.id)
      end
    end
    
    def exit(group)
      group_user = self.group_users.find_by(group_id: group.id)
      group_user.destroy if group_user
    end
    
    def participate?(group)
      self.participates.include?(group)
    end
    
    #メッセージに関する機能
    has_many :messages
    has_many :speach, through: :messages
end
