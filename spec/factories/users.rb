FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    firstname             { '漢字' }
    lastname              { '漢字' }
    firstname_kana        { 'カタカナ' }
    lastname_kana         { 'カタカナ' }
    birthday              { Faker::Date.birthday }
  end
end