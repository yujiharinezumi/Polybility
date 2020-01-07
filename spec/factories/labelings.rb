FactoryBot.define do
  factory :labeling do
    user_id { 1 }
    label_id { 1 }
    user { nil }
    label { nil }
  end
end
