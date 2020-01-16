require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
    @post1 = FactoryBot.create(:post_first, user_id: @user1.id)

  end

  it "contentが空欄ならバリデーションが通らない" do
    comment = Comment.new(content: '' ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).not_to be_valid
  end

  it "contentが75文字以上ならバリデーションが通らない" do
    comment = Comment.new(content: 'a'*76 ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).not_to be_valid
  end

  it "contentが記載していればならバリデーションが通る" do
    comment = Comment.new(content: 'aaaaa' ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).to be_valid
  end
end
