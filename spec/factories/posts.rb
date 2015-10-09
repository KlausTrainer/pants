# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user
    body { FFaker::Lorem.paragraphs.join("\n\n") }
    published_at { rand(300000).minutes.ago }
    type 'pants.post'
  end
end
