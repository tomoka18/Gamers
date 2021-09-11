require 'rails_helper'

RSpec.describe PostComment, type: :model do

  it 'タイトルと内容とゲーム名があれば投稿できる' do
    expect(FactoryBot.create(:post_comment)).to be_valid
  end

  it 'コメントがなければコメントできない' do
    expect(FactoryBot.build(:post_comment, comment: '')).to_not be_valid
  end

end
