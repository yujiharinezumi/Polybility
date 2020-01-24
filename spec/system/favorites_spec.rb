require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Favorites', type: :system do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
    @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
    @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
    @post3 = FactoryBot.create(:post_first, user_id: @user2.id)
    log_in @user1
  end

  it '投稿をお気に入りするテスト' do
    visit post_path(@post3)
    expect(page).to have_content('投稿詳細')
    click_on 'お気に入りする'
    expect(page).to have_content('bさんのブログをお気に入り登録しました')
    visit post_path(@post3)
    expect(page).to have_content('お気に入りの数:1')
  end

  it '投稿をお気に入りを削除するテスト' do
    visit post_path(@post3)
    expect(page).to have_content('投稿詳細')
    click_on 'お気に入りする'
    visit post_path(@post3)
    click_on 'お気に入り解除する'
    expect(page).to have_content('bさんのブログをお気に入り解除しました')
    visit post_path(@post3)
    expect(page).to have_content('お気に入りの数:0')
  end
end
