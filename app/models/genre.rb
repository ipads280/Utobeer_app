class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  
  validates :genres_name, uniqueness: true, presence: true
end