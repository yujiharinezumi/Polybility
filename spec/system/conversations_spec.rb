require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Conversations', type: :system do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user2 = FactoryBot.create(:user_second)
    log_in @user1
  end

  it 'ユーザーを削除した時履歴が消えるテスト' do
    click_on 'メッセージ'
    fill_in('message_body',with:"お元気ですか？")
    click_on 'commit'
    click_on 'ログアウト'
    log_in @user2
    click_on 'メッセージ'
    fill_in('message_body',with:"お元気だよ〜")
    click_on 'ログアウト'
    log_in @user1
    click_on 'testtestさん'
    click_on 'edit_button'
    click_button 'アカウントの削除'
    page.driver.browser.switch_to.alert.accept
    log_in @user2
    click_on 'トークルーム'
    expect(page).not_to have_content('testtest')
  end
end
