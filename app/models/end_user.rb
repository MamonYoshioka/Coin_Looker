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

  # 以下を追加
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
