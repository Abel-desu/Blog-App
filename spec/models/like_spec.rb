require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.new(title: 'My first post', text: 'This is my first post.', author: @user, commentsCounter: 4,
                     likesCounter: 6)
  end

  it 'should increment likesCounter by 1' do
    @post.likesCounter
    @post.increment!(:likesCounter)
    expect(@post.likesCounter).to eq(7)
  end
end
