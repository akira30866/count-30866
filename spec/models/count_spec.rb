require 'rails_helper'

RSpec.describe Count, type: :model do
  describe '新規投稿機能' do
    before do
      @count = FactoryBot.build(:count)
    end

    it '正しい情報が入力されていれば保存できる' do
      expect(@count).to be_valid
    end

    it 'remark,trialsが空でも保存できること' do
      @count.remark = nil
      @count.trials = nil
      expect(@count).to be_valid
    end

    it 'nameが空だと保存できないこと' do
      @count.name = nil
      @count.valid?
      expect(@count.errors.full_messages).to include("Name can't be blank")
    end

    it 'categoryが空だと保存できないこと' do
      @count.category = nil
      @count.valid?
      expect(@count.errors.full_messages).to include("Category can't be blank")
    end

    it 'releaseが空と保存出来ないこと' do
      @count.release = nil
      @count.valid?
      expect(@count.errors.full_messages).to include("Release can't be blank")
    end

    it 'imageが空だと保存出来ないこと' do
      @count.image = nil
      @count.valid?
      expect(@count.errors.full_messages).to include("Image can't be blank")
    end

    it 'category_idが1より大きくないと保存出来ないこと' do
      @count.category_id = 1
      @count.valid?
      expect(@count.errors.full_messages).to include("Category must be other than 1")
    end

    it 'release_idが1より大きくないと保存出来ないこと' do
      @count.release_id = 1
      @count.valid?
      expect(@count.errors.full_messages).to include("Release must be other than 1")
    end

    it 'userに紐づいていないと保存出来ないこと' do
      @count.user = nil
      @count.valid?
      expect(@count.errors.full_messages).to include("User must exist")
    end
  end
end
