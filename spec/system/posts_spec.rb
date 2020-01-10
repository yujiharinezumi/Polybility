require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Posts', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)

     @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post3 = FactoryBot.create(:post_first, user_id: @user2.id)

     log_in @user1
   end


   it 'ユーザーが投稿するテスト' do
     click_on "投稿"
     click_on "新規投稿"
     fill_in('post_title',with:"hello")
     fill_in('post_content',with:"good bye")
     click_on 'commit'
     expect(page).to have_content('hello')
     expect(page).to have_content('good bye')
    end

    it 'ユーザーが投稿詳細画面に遷移するテスト' do
      click_on "投稿"
      expect(page).to have_content('投稿一覧')
    end


  it 'ユーザーが投稿編集するテスト' do
    visit post_path(@post1)
    expect(page).to have_content('投稿詳細画面')
    click_on "編集する"
    fill_in('post_title', with:"helooo")
    fill_in('post_content', with:"gooooodbye")
    click_on "commit"
    expect(page).to have_content('投稿を編集しました！')
  end

  it 'ユーザーが投稿を削除するテスト' do
    visit post_path(@post2)
     click_on "削除する"
     expect(page).to have_content('投稿を削除しました！')
  end
end
