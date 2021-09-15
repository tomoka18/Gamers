class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy, foreign_key: 'comment_id'

  validates :comment, presence: true
end
