class Facility < ApplicationRecord
  # ロッカー情報の投稿アソシエーション
  belongs_to :end_user
end
