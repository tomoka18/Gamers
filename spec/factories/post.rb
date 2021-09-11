FactoryBot.define do
  factory :post do
    title { '誰でも' }
    body { 'お願いします' }
    user
    genre
  end
end
