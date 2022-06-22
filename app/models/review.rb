class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :title, presence: true
  validates :text, presence: true
  validates :star, presence: true,length: {minimum: 1}
end
