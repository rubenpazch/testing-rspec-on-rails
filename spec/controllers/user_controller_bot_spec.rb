require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe ' controller test cases ' do
    let(:user1) { FactoryBot.create :user }

    describe '#show' do
      it 'should return the user with given id' do
        get :show, params: { id: user1.id }
        expect(assigns(:user)).to eql(user1)
      end
    end
    describe '#index' do
      it 'render a template' do
        get :index
        expect(response).to render_template('index')
      end
      it 'assigns users' do
        User.first.delete
        User.first.delete
        User.first.delete
        puts User.all
        get :index
        expect(assigns(:users)).to eq([user1])
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
    end
  end
end
