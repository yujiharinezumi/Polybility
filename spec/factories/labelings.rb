FactoryBot.define do
  factory :labeling_first,class: Labeling do
    user_id { User.first.id }
    label_id { Label.first.id }
  end
end
