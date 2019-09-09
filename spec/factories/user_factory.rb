FactoryBot.define do
  factory :user do
    name { 'Example' }
    email { 'tes@example.com' }
    description { 'holaamigos' }
    password { 'f4k3p455w0rd' }
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    # is_active true
  end
end