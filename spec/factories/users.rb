FactoryBot.define do
  factory :user do
    nickname              { 'nickname' }
    email                 {Faker::Internet.free_email}
    password              { 'aaa111' }
    password_confirmation { password }
    birth_date            { '1933-01-01' }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
  end
end
