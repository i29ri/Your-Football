# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it '有効な登録内容は保存されるか' do
    expect(FactoryBot.build(:user)).to be_vailid
  end
end