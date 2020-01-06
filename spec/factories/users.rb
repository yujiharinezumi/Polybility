FactoryBot.define do
  factory :user do
    name { "first_user" }
    email { "1@example.com" }
    password { "111111" }
  end

  factory :second_user, class: User do
    name { "second_user" }
    email { "2@example.com" }
    password { "2222222" }
  end

  factory :third_user, class: User do
    name { "thrid_user" }
    email { "3@example.com" }
    password { "333333" }
  end
end
