class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  belongs_to :arc
  belongs_to :maker
  has_many :reviews, dependent: :destroy
  
end
