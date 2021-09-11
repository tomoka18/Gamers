require 'rails_helper'

RSpec.describe Post, type: :model do

  before do
    @genre = FactoryBot.create(:genre)
  end

  it 'タイトルと内容とゲーム名があれば投稿できる' do
    expect(FactoryBot.create(:post, genre_id: @genre.id)).to be_valid
  end

  it 'タイトルがなければ投稿できない' do
    expect(FactoryBot.build(:post, title: '')).to_not be_valid
  end

  it '内容がなければ投稿できない' do
    expect(FactoryBot.build(:post, body: '')).to_not be_valid
  end
  
  it 'ゲーム名を選ばないと投稿できない' do
    expect(FactoryBot.build(:post, genre_id: nil)).to_not be_valid
  end


end
