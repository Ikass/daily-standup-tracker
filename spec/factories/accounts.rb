FactoryBot.define do
  factory :account do
    name { "Test Account" }
    settings { {} }
    after(:build) do |account|
      account.user ||= FactoryBot.build(:user, account: account)
    end
  end
end
