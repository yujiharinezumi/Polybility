FactoryBot.define do
  factory :post_first,class: Post do
    title { 'aaa' }
    content { 'AAA' }
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/picture1.jpg'))}

  end

  factory :post_second,class: Post do
    title { 'bbb' }
    content { 'BBB' }
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/picture2.jpg'))}
  end

  factory :post_third,class:Post do
    title { 'ccc' }
    content { 'CCC' }
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/picture3.jpg'))}

  end
end
