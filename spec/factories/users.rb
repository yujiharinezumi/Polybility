FactoryBot.define do
  factory :user_first,class: User do
    name { 'a' }
    email { 'a@gmail.com' }
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
    native_language {'Japanese'}
    learning_language {'English'}


  end

  factory :user_second,class: User do
    name { 'b' }
    email { 'b@gmail.com' }
    password {'bbbbbb'}
    password_confirmation {'bbbbbb'}
    native_language {'English'}
    learning_language {'Japanese'}
  end

  factory :user_third,class: User do
    name { 'c' }
    email { 'c@gmail.com' }
    password {'cccccc'}
    native_language {'Chinese'}
    learning_language {'Thai'}
    password_confirmation {'cccccc'}
  end

  factory :admin_user,class: User do
    name { 'yuji' }
    email { 'yuji@gmail.com' }
    password {'yujiyuji'}
    password_confirmation {'yujiyuji'}
  end
end
