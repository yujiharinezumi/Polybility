require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Users', type: :system do
  # before do
  #   user = FactoryBot.create(:user)
  # end

   describe '新規登録画面' do

    it '名前が空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: '')
      fill_in('user_email', with: 'yuji@gmail.com')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: 'password')
      click_button 'commit'
      expect(page).to have_content('エラーが発生したため ユーザー は保存されませんでした:')
    end

    it 'emailが空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: 'yuji')
      fill_in('user_email', with: '')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: 'password')
      click_button 'commit'
      expect(page).to have_content('エラーが発生したため ユーザー は保存されませんでした:')
    end

    it 'passwordが空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: 'yuji')
      fill_in('user_email', with: 'yuji@gmail.com')
      fill_in('user_password', with: '')
      fill_in('user_password_confirmation', with: 'password')
      click_button 'commit'
      expect(page).to have_content('エラーが発生したため ユーザー は保存されませんでした:')
    end

    it 'password_confirmationが空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: 'yuji')
      fill_in('user_email', with: 'yuji@gmail.com')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: '')
      click_button 'commit'
      expect(page).to have_content('エラーが発生したため ユーザー は保存されませんでした:')
    end


     it 'ユーザーの新規登録のテスト' do
       visit root_path
       click_on '新規登録'
       fill_in('user_name',with: 'yuji')
       fill_in('user_email', with: 'yuji@gmail.com')
       fill_in('user_password', with: 'password')
       fill_in('user_password_confirmation', with: 'password')
       click_button 'commit'
       expect(page).to have_content 'アカウント登録が完了しました。プロフィールを充実させましょう！'
     end
   end

   describe 'ログインのテスト' do
     before do
       @user1 = FactoryBot.create(:user_first)
       @user2 = FactoryBot.create(:user_second)
       # user = FactoryBot.create(:user)
       # @user = FactoryBot.create(:user)
       # visit new_user_session_path
       # fill_in('user_email', with: @user.email)
       # fill_in('user_password', with: @user.password)
       # click_on 'commit'
     end

     it 'ログイン失敗のテスト' do
       visit root_path
       click_on 'ログイン'
       fill_in('user_email',with: "first@example.com")
       fill_in('user_password', with:'aaaaaa')
       click_button 'commit'
       expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
     end

     it 'ログイン成功のテスト' do
       visit root_path
       click_on 'ログイン'
       fill_in('user_email',with: "a@gmail.com")
       fill_in('user_password', with:'aaaaaa')
       click_on 'commit'
       expect(page).to have_content 'ログインしました。'
     end

     it 'ログアウトのテスト' do
       visit root_path
       click_on 'ログイン'
       fill_in('user_email',with: "a@gmail.com")
       fill_in('user_password', with:'aaaaaa')
       click_on 'commit'
       click_on 'ログアウト'
       expect(page).to have_content 'ログアウトしました。'
    end
   end

   describe 'ユーザーの編集、更新のテスト' do
     before do
       @user1 = FactoryBot.create(:user_first)
       @user2 = FactoryBot.create(:user_second)
     end

   it 'ユーザーの詳細画面に遷移するテスト' do
     visit root_path
     click_on 'ログイン'
     fill_in('user_email',with: "a@gmail.com")
     fill_in('user_password', with:'aaaaaa')
     click_on 'commit'
     click_on 'aさん'
     expect(page).to have_content 'プロフィール'
   end

   it 'ユーザーの編集するテスト' do
     visit root_path
     click_on 'ログイン'
     fill_in('user_email',with: "a@gmail.com")
     fill_in('user_password', with:'aaaaaa')
     click_on 'commit'
     click_on 'aさん'
     click_on 'プロフィールを編集する'
     fill_in('user_name',with: "aaaaaa")
     click_button 'Update'
     expect(page).to have_content 'アカウント情報を変更しました。'
     expect(page).to have_content 'aaaaaaさん'
   end
 end
end
