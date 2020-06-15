require 'rails_helper'

RSpec.describe User, type: :model do
  describe ' Model.User' do
    fixtures :users
    let(:user){FactoryBot.create :user}

    context 'validates field using fixtures' do
      it 'username must be valid' do
        expect(users(:one)).to be_valid
      end
      it 'username must not be valid' do
        users(:one).username = nil
        expect(users(:one)).to_not be_valid
      end
      it 'validates user already exists' do
        user_new = User.new(username: 'juanperez')
        user_new.valid?
        expect(user_new.errors[:username]).to include('Username already exists')
      end
    end

    context 'username must include the message using fixtures' do
      it 'must be given ' do
        users(:one).username = nil
        users(:one).valid?
        expect(users(:one).errors[:username]).to include('Username must be given')
      end

      it 'length between 6 to 20 characters' do
        users(:one).username = '123'
        users(:one).valid?
        expect(users(:one).errors[:username]).to include('Username length must be between 6 to 20 characters')
      end
    end

    context 'username must include the message using fixtures' do
      it 'length between 6 to 20 characters' do
        users(:one).username = '123abcgjhasjdhasjkdhasjdkhasjdkhasdjkas'
        users(:one).valid?
        expect(users(:one).errors[:username]).to include('Username length must be between 6 to 20 characters')
      end
      it 'must be alphanumeric' do
        users(:one).username = ' ruben22123123'
        users(:one).valid?
        expect(users(:one).errors[:username]).to include('Username must be alphanumeric')
      end
    end

    context 'validates field using factories and faker' do
      it 'username must be valid' do
        expect(user).to be_valid
      end
      it 'username must not be valid' do
        user.username = nil
        expect(user).to_not be_valid
      end
      it 'validates user already exists' do
        user_new = User.new(username: 'juanperez')
        user_new.valid?
        expect(user_new.errors[:username]).to include('Username already exists')
      end
    end

    context 'username must include the message using factories and faker' do
      it 'must be given ' do
        user.username = nil
        user.valid?
        expect(user.errors[:username]).to include('Username must be given')
      end

      it 'length between 6 to 20 characters' do
        user.username = '123'
        user.valid?
        expect(user.errors[:username]).to include('Username length must be between 6 to 20 characters')
      end
    end

    context 'username must include the message using factories and faker' do
      it 'length between 6 to 20 characters' do
        user.username = '123abcgjhasjdhasjkdhasjdkhasjdkhasdjkas'
        user.valid?
        expect(user.errors[:username]).to include('Username length must be between 6 to 20 characters')
      end
      it 'must be alphanumeric' do
        user.username = ' ruben22123123'
        user.valid?
        expect(user.errors[:username]).to include('Username must be alphanumeric')
      end
    end
  end
end
