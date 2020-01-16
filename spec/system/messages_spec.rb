require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Messages', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)
     @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post3 = FactoryBot.create(:post_first, user_id: @user2.id)
     log_in @user1
   end

   it '他のユーザーにメッセージするテスト' do
     click_on 'メッセージ'
     fill_in('message_body',with:"お元気ですか？")
     click_on 'commit'
     expect(page).to have_content('お元気ですか？')
  end

  it '自分のメッセージを削除するテスト' do
    click_on 'メッセージ'
    fill_in('message_body',with:"お元気ですか？")
    click_on 'commit'
    click_on '削除'
    expect(page).not_to have_content('お元気ですか？')

 end

  it 'メッセージを見た後既読になるかのテスト' do
    click_on 'メッセージ'
    fill_in('message_body',with:"お元気ですか？")
    click_on 'commit'
    click_on 'ログアウト'
    log_in @user2
    click_on 'メッセージ'
    fill_in('message_body',with:"お元気だよ〜")
    click_on 'ログアウト'
    log_in @user1
    click_on 'メッセージ'
    expect(page).to have_content('既読')
  end
end
