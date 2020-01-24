require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Relationships', type: :system do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
    @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
    @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
    @post3 = FactoryBot.create(:post_first, user_id: @user2.id)
    log_in @user1
  end

  it '他のユーザーをフォローするテスト' do
    visit users_path
    click_on "フォローする", match: :first
    expect(page).not_to have_content('フォローする')
  end

  it '他のユーザーをフォロー解除するテスト' do
    visit users_path
    click_on "フォローする", match: :first
    click_on "キャンセル", match: :first
    expect(page).not_to have_content('キャンセル')
  end
end
