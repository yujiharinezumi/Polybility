require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Labels', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)

     @post1 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post2 = FactoryBot.create(:post_first, user_id: @user1.id)
     @post3 = FactoryBot.create(:post_first, user_id: @user2.id)

     @label1 = FactoryBot.create(:label_first)
     @label2 = FactoryBot.create(:label_second)
     @label3 = FactoryBot.create(:label_third)

     log_in @user1
   end

   it 'ラベルで検索するテスト' do
     select 'Sports', from:'hobby'
     click_on '検索'
     expect(page).to have_content('Sports')


  end
end
