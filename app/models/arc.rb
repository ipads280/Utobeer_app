class Arc < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :arcs_name, uniqueness: true, presence: true
end
