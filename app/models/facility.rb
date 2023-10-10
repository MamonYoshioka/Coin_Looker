class Facility < ApplicationRecord
  # ロッカー情報の投稿アソシエーション
  belongs_to :end_user
  # 追記情報投稿とのアソシエーション
  has_many :post_scripts, dependent: :destroy
end
