FactoryBot.define do
  factory :post_comment do
    comment { 'こんにちは' }
    user
    post
  end
end
