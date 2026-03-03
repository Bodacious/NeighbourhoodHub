FactoryBot.define do
  factory :identification_user, class: "Identification::User" do
    email { "MyString" }
    password { "MyString" }
    name { "MyString" }
  end
end
