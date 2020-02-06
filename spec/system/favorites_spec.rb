require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Favorites', type: :system do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
    @post1 = FactoryBot.create(:post_first, user_id: @user2.id)
    log_in @user1
  end

  it '投稿をお気に入りするテスト' do
    visit posts_path
    click_on "詳細"
    expect(page).to have_content('投稿詳細')
    click_on 'お気に入りする'
    expect(page).to have_content('投稿をお気に入りしました')
    visit posts_path
    click_on "詳細"
    expect(page).to have_content('1')
  end

  it '投稿をお気に入りを削除するテスト' do
    visit posts_path
    click_on "詳細"
    expect(page).to have_content('投稿詳細')
    click_on 'お気に入りする'
    visit posts_path
    click_on "詳細"
    click_on 'お気に入りの解除'
    expect(page).to have_content('お気に入りを解除しました')
    expect(page).to have_content('0')
  end
end
