class PostScript < ApplicationRecord
  belongs_to :end_user
  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
end
