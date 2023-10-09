class PostScriptsController < ApplicationController
  def index
  end

  # 追記情報詳細
  def show
    @post_script = PostScript.find(params[:id])
  end

  # 追記新規
  def new
    @post_script = PostScript.new
  end

  # 追記登録
  def create
    # PostScriptモデルの初期化
    @post_script = PostScript.new(post_script_params)
    @post_script.end_user_id = current_end_user.id
    # PostScriptモデルをDBへ保存
    @post_script.save
    # showページへ画面遷移
    redirect_to post_script_path(@post_script.id)
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
