class EndUser::MembersController < ApplicationController
# 会員情報
  def mypage
    @member = current_end_user
  end
# 会員情報の編集
  def edit
    @member = current_end_user
  end

#会員情報の更新
  def update
    @member = current_end_user
    if @member.update(mypage_params)
      flash[:notice] = "会員情報変更しました。"
      redirect_to end_user_member_path
    else
      flash[:notice] = "変更内容が正しくありません。"
      redirect_to end_user_member_edit_path
    end
  end

  def withdrawal
    @member = EndUser.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
    def mypage_params
      params.require(:end_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email,:nick_name)
    end
end
