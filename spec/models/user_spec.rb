require 'rails_helper'

RSpec.describe User, type: :model do
  before do
   @user1 = FactoryBot.create(:user_first)
  end

  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: '', email: 'test@gmail.com', password: '111111')
    expect(user).not_to be_valid
  end

  it "nameが35文字以上ならバリデーションが通らない" do
    user = User.new(name: 'a'*36, email: 'test@gmail.com', password: '111111')
    expect(user).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new(name: 'テスト', email: '', password: '111111')
    expect(user).not_to be_valid
  end

  it "emailが形式が違ったらバリデーションが通らない" do
    user = User.new(name: 'テスト', email: 'testtest', password: '111111')
    expect(user).not_to be_valid
  end

  it "emailが大文字でもバリデーションが通る" do
    user = User.new(name: 'テスト', email: 'TEST@gmail.com', password: '111111')
    expect(user).to be_valid
  end

  it "emailがすでに登録されている場合バリデーションが通らない" do
    user = User.new(name: 'テスト', email: 'a@gmail.com', password: '111111')
    expect(user).not_to be_valid
  end

  it "passwordが6文字以下ならバリデーションが通らない" do
    user = User.new(name: 'テスト', email: 'testtest@t.com', password: '1')
    expect(user).not_to be_valid
  end

  it "ageがマイナスならバリデーションが通らない" do
    user = User.new(name: 'テスト', email: 'testtest@t.com', password: '111111',age:-1)
    expect(user).not_to be_valid
  end

  it "ageとmailとpasswordに内容が記載されていればバリデーションが通る" do
    user = User.create(name: 'name', email: 'a@example.com', password: 'password')
    expect(user).to be_valid
  end
end
