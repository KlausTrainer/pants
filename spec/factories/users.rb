# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    domain       { FFaker::Internet.domain_name }
    display_name { FFaker::Name.name }
    password     { SecureRandom.hex }
    hosted true
  end
end
