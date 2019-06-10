FactoryBot.define do
  factory :employer do
    sequence(:email) {|n| "email#{n}"}
    sequence(:password) {|n| "password#{n}"}
    sequence(:street_address) {|n| "street_address#{n}"}
    city {"New York"}
    state {"NY"}
    sequence(:company_name) {|n| "company#{n}"}
  end
end
