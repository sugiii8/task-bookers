class Book < ApplicationRecord
  validates :title, presence: true
  validates :body,
            presence: true,
            length: { maximum: 200 }

  belongs_to :user

  attachment :image

  def mine?(current_user_id)
    user.id == current_user_id
  end
end
