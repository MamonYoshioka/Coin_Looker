class PostScriptsController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :index, :show, :create, :update, :destroy]
  def index
  end

  # 追記情報詳細
  def show
    @post_script = PostScript.find(params[:id])
    @post_script_comment = @post_script.post_script_comments.build
    @post_script_comments = @post_script.post_script_comments
  end

  # 追記新規投稿
  def new
    @post_script = PostScript.new
    @facility = Facility.find(params[:facility_id])
  end

  # 追記登録
  def create
    # PostScriptモデルの初期化
    @facility = Facility.find(params[:facility_id])
    @post_script = PostScript.new(post_script_params)
    @post_script.end_user_id = current_end_user.id
    @post_script.facility_id = @facility.id
    # PostScriptモデルをDBへ保存
    if @post_script.save
      flash[:notice] = "追記投稿できました"
      # showページへ画面遷移
      redirect_to facility_post_script_path(@facility.id, @post_script.id)
    else
      flash.now[:alert] = "再度追記投稿の内容を入力してください。"
      render :new
    end
  end

  # 登録編集
  def edit
  end

  # 登録内容更新
  def update
  end

  # 投稿削除
  def destroy
    @post_script = PostScript.find(params[:id])
    @post_script.destroy
    redirect_to facilities_path
  end

  private
  def post_script_params
    params.require(:post_script).permit(:title, :content)
  end
end
