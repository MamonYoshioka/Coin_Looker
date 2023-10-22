class Admin::EndUsersController < ApplicationController
before_action :authenticate_admin!
  def index
    @end_users = EndUser.all.page(params[:page])
  end

  def unsubscribe
    @member = EndUser.find(params[:id])
    @member.update(is_deleted: !@member.is_deleted)
     if @member.is_deleted
       flash[:notice] = "利用停止中に変更"
     else
       flash[:notice] = "利用中に変更"
     end
    redirect_to admin_end_users_path
  end
end
