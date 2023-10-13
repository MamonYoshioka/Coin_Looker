class PostScriptComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_script

  validates :comment, presence: true
end