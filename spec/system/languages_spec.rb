require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Languages', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)
     @user3 = FactoryBot.create(:user_third)


     @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post3 = FactoryBot.create(:post_first, user_id: @user2.id)

     @lang1 = FactoryBot.create(:lang_first)
     @lang2 = FactoryBot.create(:lang_second)
     @lang3 = FactoryBot.create(:lang_third)

     log_in @user1
   end

   it '母語でユーザーを検索するテスト' do
      select 'English', from: 'native'
      click_on '検索'
      expect(page).to have_content('English')
    end

    it '学習言語でユーザーを検索するテスト' do
       select 'Thai', from: 'learning'
       click_on '検索'
       expect(page).to have_content('English')
     end

     it '母国語と学習言語でユーザーを検索するテスト' do
        select 'English', from: 'native'
        select 'Japanese', from: 'learning'
        click_on '検索'
        expect(page).to have_content('English')
        expect(page).to have_content('Japanese')
      end
end
