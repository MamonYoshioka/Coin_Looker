class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ロッカー情報の投稿アソシエーション(複数投稿)
  has_many :facilities

  # いいね機能(複数のユーザーからのいいね)
  has_many :favorites, dependent: :destroy

  # 追記投稿についてのコメント機能とのアソシエーション
  has_many :post_script_comments, dependent: :destroy
end
