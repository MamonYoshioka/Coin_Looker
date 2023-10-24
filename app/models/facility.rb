class Facility < ApplicationRecord
  # ロッカー情報の投稿アソシエーション
  belongs_to :end_user
  # 追記情報投稿とのアソシエーション
  has_many :post_scripts, dependent: :destroy
  #ページネーション
  paginates_per 20

  # ロッカー複数枚画像を投稿できるようにする
  has_many_attached :images

  validates :loker_name, presence: true
  validates :area_name, presence: true
  validates :area_introduction, presence: true




  def create
    @facility = Facility.find(params[facility_id])
    @post_script = Script.new(script_params)

    @post_script.end_user_id = current_end_user.id
    @post_script.post_script_id = @post_script.id

    @post_script.save
  end

  def destroy
    #@facility = Facility.find(params[facility_id])
    #Script.find_by(id: params[:id], post_script_id: params[:post_script_id]).destroy
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Facility.where(area_name: content)
    elsif method == 'forward'
      Facility.where('area_name LIKE ?', content + '%')
    elsif method == 'backward'
      Facility.where('area_name LIKE ?', '%' + content)
    else
      Facility.where('area_name LIKE ?', '%' + content + '%')
    end
  end

  #GoogleMapに関する記述
  geocoded_by :address
  after_validation :geocode, if: :address_changed?



  private
  def post_script_params
    params.require(:post_script).permit(:title, :content)
  end
end
