require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Users', type: :system do
  describe '新規登録画面' do
    it '名前が空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: '')
      fill_in('user_email', with: 'yuji@gmail.com')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: 'password')
      click_button 'commit'
      expect(page).to have_content('名前を入力してください')
    end

    it 'emailが空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: 'yuji')
      fill_in('user_email', with: '')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: 'password')
      click_button 'commit'
      expect(page).to have_content('メールアドレスを入力してください')
    end

    it 'passwordが空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: 'yuji')
      fill_in('user_email', with: 'yuji@gmail.com')
      fill_in('user_password', with: '')
      fill_in('user_password_confirmation', with: 'password')
      click_button 'commit'
      expect(page).to have_content('パスワードを入力してください')
    end

    it 'password_confirmationが空欄でエラーメッセージが出るテスト' do
      visit root_path
      click_on '新規登録'
      fill_in('user_name', with: 'yuji')
      fill_in('user_email', with: 'yuji@gmail.com')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: '')
      click_button 'commit'
      expect(page).to have_content('確認用パスワードとパスワードの入力が一致しません')
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
       @country1 = FactoryBot.create(:country_first)
       @country2 = FactoryBot.create(:country_second)
       @country3 = FactoryBot.create(:country_third)
       @lang1 = FactoryBot.create(:lang_first)
       @lang2 = FactoryBot.create(:lang_second)
       @lang3 = FactoryBot.create(:lang_third)
       @label1 = FactoryBot.create(:label_first)
       @label2 = FactoryBot.create(:label_second)
       @label3 = FactoryBot.create(:label_third)
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
       log_in @user1
       expect(page).to have_content 'ログインしました。'
     end

     it 'ログアウトのテスト' do
       log_in @user1
       click_on 'ログアウト'
       expect(page).to have_content 'ログアウトしました。'
     end
   end

   describe 'ユーザーの編集、更新のテスト' do
     before do
       @user1 = FactoryBot.create(:user_first)
       @user2 = FactoryBot.create(:user_second)
       @user3 = FactoryBot.create(:admin_user)
       @country1 = FactoryBot.create(:country_first)
       @country2 = FactoryBot.create(:country_second)
       @country3 = FactoryBot.create(:country_third)
       @lang1 = FactoryBot.create(:lang_first)
       @lang2 = FactoryBot.create(:lang_second)
       @lang3 = FactoryBot.create(:lang_third)
     end

     it 'ユーザーの詳細画面に遷移するテスト' do
       log_in @user1
       click_on 'testtestさん'
       expect(page).to have_content 'プロフィール'
     end

     it 'ユーザーの編集するテスト' do
       log_in @user1
       click_on 'testtestさん'
       click_on 'edit_button'
       fill_in('user_name',with: "aaaaaa")
       fill_in('user_age',with:20)
       choose 'user_gender_女性'
       select 'Japan', from: 'user_country'
       select 'Japanese', from: 'user_native_language'
       select 'Thai', from: 'user_learning_language'
       fill_in('user_introduction',with: "こんにちは！")
       click_button 'Update'
       expect(page).to have_content 'アカウント情報を変更しました。'
       expect(page).to have_content 'aaaaaaさん'
     end

     it 'ユーザーの年齢をマイナスにした時に編集ができない' do
       log_in @user1
       click_on 'testtestさん'
       click_on 'edit_button'
       fill_in('user_name',with: "aaaaaa")
       fill_in('user_age',with:-20)
       choose 'user_gender_女性'
       select 'Japan', from: 'user_country'
       select 'Japanese', from: 'user_native_language'
       select 'Thai', from: 'user_learning_language'
       fill_in('user_introduction',with: "こんにちは！")
       click_button 'Update'
       expect(page).to have_content '年齢は0以上の値にしてください'
     end

     it 'ユーザーの削除するテスト' do
       log_in @user1
       click_on 'testtestさん'
        click_on 'edit_button'
       click_button 'アカウントの削除'
       page.driver.browser.switch_to.alert.accept
       expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
     end

     it 'ログインユーザーが新規登録画面に遷移させないテスト' do
       log_in @user1
       visit new_user_session_path
       expect(page).to have_content 'すでにログインしています。'
     end

     it '未登録ユーザーが登録後の画面に遷移させないテスト' do
       visit users_path
       expect(page).to have_content 'アカウント登録もしくはログインしてください。'
     end

     it 'ゲストユーザーでログインできるかのテスト' do
       visit root_path
       click_on 'ゲストユーザーでログイン'
       expect(page).to have_content 'ゲストユーザーとしてログインしました。'
     end

     it 'ゲストユーザーは編集できないテスト' do
       visit root_path
       click_on 'ゲストユーザーでログイン'
       click_on 'guestさん'
       click_on 'edit_button'
       fill_in('user_name',with: 'Ruby')
       fill_in('user_email',with: 'change@gmail.com')
       fill_in('user_password',with: 'aaaaaa')
       fill_in('user_password_confirmation',with: 'aaaaaa')
       click_button 'Update'
       expect(page).to have_content 'ゲストユーザーの変更・削除はできません。'
     end

     it 'ゲストユーザーを削除できないテスト' do
       visit root_path
       click_on 'ゲストユーザーでログイン'
       click_on 'guestさん'
       click_on 'edit_button'
       click_button 'アカウントの削除'
       page.driver.browser.switch_to.alert.accept
       expect(page).to have_content 'ゲストユーザーの変更・削除はできません。'
     end

     it 'アドミンユーザーを確認するテスト' do
       visit root_path
       click_on 'ログイン'
       fill_in('user_email',with: "yuji@gmail.com")
       fill_in('user_password', with:'yujiyuji')
       click_button 'commit'
       click_on '管理者'
     end
   end
end
