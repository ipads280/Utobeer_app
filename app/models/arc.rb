class Arc < ApplicationRecord
  has_many :items, dependent: :destroy
end
