class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  belongs_to :arc
  belongs_to :maker
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:star).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:star).round(1).to_f*100/5
    else
      0.0
    end
  end
  
  def star
    self.star.to_f*20
  end
  
end
