require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @user1 = FactoryBot.create(:user_first)
    @user1 = FactoryBot.create(:user_second)
  end
end
