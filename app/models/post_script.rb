class PostScript < ApplicationRecord
  belongs_to :end_user

  # 追記投稿
  belongs_to :facility
  # いいね機能
  has_many :favorites, dependent: :destroy

  # 追記投稿についてのコメント機能とのアソシエーション
  has_many :post_script_comments, dependent: :destroy


  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
end
