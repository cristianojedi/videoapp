require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validações' do
    it  'campo email ' do
      is_expected.to validate_presence_of(:email)
    end

    it  'campo senha' do
      is_expected.to validate_presence_of(:password)
    end
  end

  context 'associações' do
    it 'video' do
      is_expected.to have_many(:videos)
    end
  end
end
