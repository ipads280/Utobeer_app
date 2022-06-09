class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :arc
  belongs_to :maker
end
