require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'タイトルがなければ投稿できない' do
    expect(FactoryBot.build(:post, title: '')).to_not be_valid
  end

  it '内容がなければ登録できない' do
    expect(FactoryBot.build(:post, body: '')).to_not be_valid
  end


end
