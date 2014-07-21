require 'faker'

FactoryGirl.define do
  factory :user do
    # id 1
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "test" }
    password_confirmation { "test" }

    # factory :invalid_user do
    #   first_name { nil }
    #end

  end
end
