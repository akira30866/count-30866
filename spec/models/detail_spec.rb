require 'rails_helper'

RSpec.describe Detail, type: :model do
  describe '' do
    before do
      @detail = FactoryBot.build(:detail)
    end

    it '正しい情報が入力されていれば保存できる' do
      expect(@detail).to be_valid
    end

    it 'title,number,probabilityが空でも保存できること' do
      @detail.title = nil
      @detail.number = nil
      @detail.probability = nil
      expect(@detail).to be_valid
    end

    it '' do
      @detail.count = nil
      @detail.valid?
      expect(@detail.errors.full_messages).to include("Count must exist")
    end
  end
end
