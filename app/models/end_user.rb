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

  # ゲストログイン、以下を追加
  def self.guest
    find_or_create_by!(email: 'guest@example.com', ) do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      end_user.family_name = 'ゲスト'
      end_user.first_name = '太郎'
      end_user.family_name_kana = 'ゲスト'
      end_user.fist_name_kana = 'タロウ'
      end_user.nick_name = '-'
    end
  end
  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      EndUser.where(name: content)
    elsif method == 'forward'
      EndUser.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      EndUser.where('name LIKE ?', '%' + content)
    else
      EndUser.where('name LIKE ?', '%' + content + '%')
    end
  end
end
