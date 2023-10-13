class PostScriptsController < ApplicationController
  def index
  end

  # 追記情報詳細
  def show
    @post_script = PostScript.find(params[:id])
    @book_comment = PostScriptComment.new
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
    @post_script.save
    # showページへ画面遷移
    redirect_to facility_post_script_path(@facility.id, @post_script.id)
  end

  # 登録編集
  def edit
  end

  # 登録内容更新
  def update
  end

  # 投稿削除
  def destroy
    @facility= Facility.find(params[:facility_id])
    @post_script = PostScript.find(params[:id])
    @post_script.destroy
    redirect_to facilities_path
  end

  private
  def post_script_params
    params.require(:post_script).permit(:title, :content)
  end
end
