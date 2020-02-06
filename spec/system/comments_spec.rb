require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Comments', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)
     @post3 = FactoryBot.create(:post_first, user_id: @user2.id)
     log_in @user1
   end

   it '投稿にコメントをするテスト' do
     visit posts_path
     click_on "詳細"
     expect(page).to have_content('投稿詳細')
     fill_in('comment_content',with:"いいね！")
     click_on 'post_comment'
     expect(page).to have_content('いいね！')
   end

   it '自分のコメントを編集して更新するテスト' do
     visit posts_path
     click_on "詳細"
     expect(page).to have_content('投稿詳細')
     fill_in('comment_content',with:"いいね！")
     click_on 'post_comment'
     click_on '編集'
     fill_in('edit_comment',with:"good!")
     click_on '更新'
   end

   it '自分のコメントを編集が失敗するテスト' do
     visit posts_path
     click_on "詳細"
     expect(page).to have_content('投稿詳細')
     fill_in('comment_content',with:"いいね！")
     click_on 'post_comment'
     click_on '編集'
     fill_in('edit_comment',with:"")
     click_on '更新'
     expect(page).to have_content('Contentを入力してください')
   end

   it 'コメントを削除するテスト' do
     visit posts_path
     click_on "詳細"
     expect(page).to have_content('投稿詳細')
     fill_in('comment_content',with:"いいね！")
     click_on 'post_comment'
     click_on '削除'
   end
end
