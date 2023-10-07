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
      redirect_to end_user_member_mypage_path
    else
      flash[:notice] = "変更内容が正しくありません。"
      redirect_to end_user_member_edit_path
    end
  end

  private
    def mypage_params
      params.require(:member).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email,:nick_name)
    end
end
