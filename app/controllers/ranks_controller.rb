class RanksController < ApplicationController
  def index
     @star_ranks = Item.find(Review.group(:star).order('avg(star) desc').pluck(:item_id))
   #groupメソッドで、指定したカラムのデータの種類ごとにデータをまとめる。
   #ここでは、Review.group(:star)で種類ごとにわける
   #グループ分けしたものを番号の多い順に並び替える
  end
end
