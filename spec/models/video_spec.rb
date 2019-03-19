require 'rails_helper'

RSpec.describe Video, type: :model do
  context 'validações' do
    it 'campo nome' do
      is_expected.to validate_presence_of(:name)
    end

    it 'campo url' do
      is_expected.to validate_presence_of(:url)
    end
  end

  context 'associações' do
    it 'usuário' do
      is_expected.to belong_to(:user)
    end
  end

  context 'criação' do
    it 'valido com nome e url definidos' do
      video = create(:video)
      expect(video).to be_valid
    end
  end
end
