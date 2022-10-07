class Comment < ApplicationRecord
  belongs_to :AuthorId
  belongs_to :PostId
  belongs_to :UpdateAT
  belongs_to :CreateAT
end
