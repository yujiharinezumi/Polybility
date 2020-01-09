FactoryBot.define do
  factory :country_first,class: Country do
    name { 'Japan' }
  end

  factory :country_second,class: Country do
    name { 'China' }
  end

  factory :country_third,class: Country do
    name { 'Thailand' }
  end
end
