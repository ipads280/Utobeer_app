class HomesController < ApplicationController

  def top
   @reviews=Review.order(created_at: :desc).limit(5)

   @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(2).pluck(:item_id))
   #groupメソッドで、指定したカラムのデータの種類ごとにデータまとめる。
   #つまり、 Favorie.group(:item_id)でアイテム番号が同じものでグループ分けする
   #グループ分けしたものを番号の多い順に並び替える
   #limit(2)で最大表示数を二つに制限する
   #pluck(:item_id)で最後に:item_idカラムのみを数字で取り出す指定

   @star_ranks = Item.find(Review.group(:star).order('avg(star) desc').limit(2).pluck(:item_id))
   #groupメソッドで、指定したカラムのデータの種類ごとにデータをまとめる。
   #ここでは、Review.group(:star)で種類ごとにわける
   #グループ分けしたものを番号の多い順に並び替える
   

   @random = Item.order("RANDOM()").limit(1)
  end

  def about
  end
end
