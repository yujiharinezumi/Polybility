require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user_first)
  end
  it "titleが空ならバリデーションが通らない" do
    post = Post.new(title: '', content: 'hello world', image:"default.jpg",user_id: @user.id )
      expect(post).not_to be_valid
    end

  it "titleが30文字以上ならバリデーションが通らない" do
    post = Post.new(title: 'a'*31, content: 'hello world', image:"default.jpg",user_id: @user.id )
      expect(post).not_to be_valid
    end

  it "contentが空ならバリデーションが通らない" do
    post = Post.new(title: 'hello', content: '', image:"default.jpg",user_id: @user.id)
    expect(post).not_to be_valid
    end

  it "contentが30文字以上ならバリデーションが通らない" do
    post = Post.new(title: 'hello', content: 'a'*76, image:"default.jpg",user_id: @user.id )
      expect(post).not_to be_valid
    end

  it "title,contentが記載されている場合バリデーションが通る" do
    post = Post.new(title: 'hello', content: 'hellohello', image:"default.jpg",user_id: @user.id)
    expect(post).to be_valid
  end
end
