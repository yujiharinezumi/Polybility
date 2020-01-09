FactoryBot.define do
  factory :label_first,class: Label do
    hobby { "sports" }
  end

  factory :label_second,class: Label do
    hobby { "Music" }
  end

  factory :label_third,class: Label do
    hobby { "Reading" }
  end
end
