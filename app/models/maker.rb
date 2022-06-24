class Maker < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :makers_name, uniqueness: true, presence: true
end
