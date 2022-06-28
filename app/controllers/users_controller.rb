class UsersController < ApplicationController
  before_action :authenticate_user!

  def favorites
    @user=User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
   @user=User.find(params[:id])
   if @user==current_user
     render 'edit'
   else
     redirect_to items_path
   end
  end

  def update
    user=current_user
    user.update(user_params)
    redirect_to user_path(user.id), notice: "編集成功しました"
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction,:image,:is_deleted)
  end

end
