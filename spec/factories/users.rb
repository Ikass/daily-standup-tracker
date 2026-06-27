FactoryBot.define do
  factory :user do
    name { "MyString" }
    email_address { Faker::Internet.email }
    time_zone { "MyString" }
    password { "password" }
    after(:build) do |user|
      user.account ||= FactoryBot.build(:account, user: user)
    end
  end
end
