class User < ApplicationRecord

    has_many :posts, foreign_key: :author_id, dependent: :destroy
    has_many :comments, foreign_key: :author_id, dependent: :destroy
    has_many :likes, foreign_key: :author_id, dependent: :destroy
  
    
    validates :name, presence: true, allow_blank: false
    validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }
  
    def recent_3_posts
      posts.limit(3).order(created_at: :desc)
    end
    
  end
  
<<<<<<< HEAD

=======
>>>>>>> dda5a04c53ef2f847d7cd1327b3d8a028e0dae7b
