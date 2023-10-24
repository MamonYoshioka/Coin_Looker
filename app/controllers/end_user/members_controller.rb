class EndUser::MembersController < ApplicationController
before_action :authenticate_end_user!
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
      flash.now[:alert] = "変更内容が正しくありません。"
      render 'end_user/members/edit'
    end
  end

  private
    def mypage_params
      params.require(:end_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email,:nick_name)
    end
end
