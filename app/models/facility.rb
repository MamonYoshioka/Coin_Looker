class Facility < ApplicationRecord
  # ロッカー情報の投稿アソシエーション
  belongs_to :end_user
  # 追記情報投稿とのアソシエーション
  has_many :post_scripts, dependent: :destroy

  def create
    @facility = Facility.find(params[facility_id])
    @post_script = Script.new(script_params)

    @post_script.end_user_id = current_end_user.id
    @post_script.post_script_id = @post_script.id

    @post_script.save
  end

  def destroy
    @facility = Facility.find(params[facility_id])
    Script.find_by(id: params[:id], post_script_id: params[:post_script_id]).destroy
  end

  private
  def post_script_params
    params.require(:post_script).permit(:title, :content)
  end
end
