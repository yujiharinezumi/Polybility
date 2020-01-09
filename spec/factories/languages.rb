FactoryBot.define do
  factory :lang_first,class: Language do
    name { 'Japanese' }
  end

  factory :lang_second,class: Language do
    name { 'English' }
  end

  factory :lang_third,class: Language do
    name { 'Thai' }
  end
end
