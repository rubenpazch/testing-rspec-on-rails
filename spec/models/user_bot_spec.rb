require 'rails_helper'

RSpec.describe User, type: :model do
  describe ' Model.User' do
    let(:user1) { FactoryBot.create :user }

    context 'validates field using fixtures' do
      it 'username must be valid' do
        expect(user1).to be_valid
      end
      it 'username must not be valid' do
        user1.username = nil
        expect(user1).to_not be_valid
      end      
    end
  end
end
