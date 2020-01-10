require 'rails_helper'

RSpec.describe Post, type: :model do
  it "titleが空ならバリデーションが通らない" do
    post = Post.new(title: '', content: 'hello world', image:"default.jpg")
      expect(post).not_to be_valid
    end

  it "contentが空ならバリデーションが通らない" do
    post = Post.new(title: 'hello', content: '', image:"default.jpg")
    expect(post).not_to be_valid
    end

    # it "title,contentが記載されている場合バリデーションが通る" do
    #    post = Post.new(title: 'hello', content: 'hellohello', image:"default.jpg")
    #    expect(post).to be_valid
    #  end
end
