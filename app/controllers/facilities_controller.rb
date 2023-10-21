class FacilitiesController < ApplicationController
  # ロッカー情報の一覧
  def index
    @facilities = Facility.all.includes(:end_user).page(params[:page]).per(5)
  end

  # 情報詳細
  def show
    @facility = Facility.find(params[:id])
    # ロッカー情報追記の一覧(特定の記事にだけ投稿)
    @post_scripts = @facility.post_scripts
  end

  # 新規作成
  def new
    @facility = Facility.new
  end

  # 新規登録
  def create
    # Facilityモデルの初期化
    @facility = Facility.new(facility_params)
    @facility.end_user_id = current_end_user.id
    # FacilityモデルをDBへ保存
    @facility.save
    # showページへ画面遷移
    redirect_to facility_path(@facility.id)
  end

  # 登録編集
  def edit
    @book = Facility.find(params[:id])
  end

  # 登録内容更新
  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      flash[:notice] = "You have updated facility successfully."
      redirect_to @facility
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  # 投稿削除
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to facilities_path
  end

  private
  def facility_params
    params.require(:facility).permit(:loker_name, :area_name, :area_introduction, :cost, :latitude,:longitude, :address,:number_of_loker, images: [])
  end

end
