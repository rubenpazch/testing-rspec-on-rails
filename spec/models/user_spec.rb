# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe ' Model.User' do
    fixtures :users

    context 'validates field' do
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
  end
end
