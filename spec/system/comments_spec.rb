require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Comments', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)

     @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post3 = FactoryBot.create(:post_first, user_id: @user2.id)

     log_in @user1
   end

   it '投稿にコメントをするテスト' do
      visit post_path(@post3)
     expect(page).to have_content('投稿詳細画面')
     fill_in('comment_content',with:"いいね！")
     click_on 'Create Comment'
     expect(page).to have_content('いいね！')
    end

    it 'コメントを削除するテスト' do
       visit post_path(@post3)
      expect(page).to have_content('投稿詳細画面')
      fill_in('comment_content',with:"いいね！")
      click_on 'Create Comment'
      click_on '削除'
     end
end
