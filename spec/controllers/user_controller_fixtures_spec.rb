require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe ' controller test cases ' do
    fixtures :users

    let(:user1) { users(:one) }
    let(:user2) { users(:two) }
    let(:user) { FactoryBot.create :user }

    describe '#show' do
      it 'should return the user with given id' do
        new_user = FactoryBot.create :user
        get :show, params: { id: new_user.id }
        expect(assigns(:user)).to eql(new_user)
      end
    end

    describe '#create' do
      it 'redirects to @user' do
        new_user = FactoryBot.build :user
        post :create, params: {
          user: {
            id: new_user.id,
            username: new_user.username,
            email: new_user.email
          }
        }
        expect(response).to redirect_to(assigns(:user))
      end

      it 'render :new' do
        new_user = FactoryBot.build :user
        post :create, params: {
          user: {
            id: new_user.id,
            username: 'asjdhajsdhasjdhaksjdh234723648723642783',
            email: new_user.email
          }
        }
        expect(response).to render_template(:new)
      end

      # it 'redirects to wishlists_url' do
      #  new_user = FactoryBot.create :user
      #  post :create, params: { user: { id: new_user.id, username: new_user.username } }
      #  expect(response).to redirect_to new_user
      # end
    end
  end
end
