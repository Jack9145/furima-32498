FactoryBot.define do
  factory :user do
    Gimei.name
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    zenkaku_first_name    { Gimei.name.first.kanji }
    zenkaku_family_name   { Gimei.name.last.kanji }
    kana_first_name       { Gimei.name.first.katakana }
    kana_family_name      { Gimei.name.last.katakana }
    birthday              { Faker::Date.backward }
  end
end
