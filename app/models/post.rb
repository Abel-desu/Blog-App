class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy



  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }


  after_save :update_post_counter

  def update_post_counter
    author.increment!(:postsCounter)
  end

  def recent_5_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
