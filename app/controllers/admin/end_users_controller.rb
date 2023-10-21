class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all.page(params[:page])
  end

  def unsubscribe
    @member = EndUser.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
end
