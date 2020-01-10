require 'rails_helper'
require 'support/utilities'

RSpec.describe 'Labels', type: :system do
   before do
     @user1 = FactoryBot.create(:user_first)
     @user2 = FactoryBot.create(:user_second)

     @label1 = FactoryBot.create(:label_first)
     @label2 = FactoryBot.create(:label_second)
     @label3 = FactoryBot.create(:label_third)

     @labeling1 = FactoryBot.create(:labeling_first)

     log_in @user2
   end

   it 'ラベルで検索するテスト' do
     select 'Sports', from:'hobby'
     click_on '検索'
     expect(page).to have_content('testtest')
  end
end
