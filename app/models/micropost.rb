class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
   has_many :favorites
   has_many :favedmicroposts, through: :favorites, source: :user
   
   def fav(user)
        self.favorites.find_or_create_by(user_id: user.id)
   end 
    
    def unfav(user)
        favorite = self.favorites.find_by(user_id: user.id)
        favorite.destroy if favorite
    end 
    
    def fav?(user)
        self.favedmicroposts.include?(user)
    end 
end
