class Admin::FacilitiesController < ApplicationController
before_action :authenticate_admin!
  def index
    @facilities = Facility.all.includes(:end_user).page(params[:page]).per(10)
  end

  def show
    @facility = Facility.find(params[:id])
    # ロッカー情報追記の一覧(特定の記事にだけ投稿)
    @post_scripts = @facility.post_scripts
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to admin_facilities_path
  end
end
