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
    end
    
    describe '#new ' do 
      it 'render :new' do
        new_user = FactoryBot.build :user
        get :new, params: {
          user: {
            id: new_user.id,
            username: 'asjdhajsdhasjdhaksjdh234723648723642783',
            email: new_user.email
          }
        }
        expect(response).to render_template(:new)
      end
    end 

    describe '#edit ' do 
      it 'render :edit' do
        new_user = FactoryBot.create :user
        get :edit, params: {
            id: new_user.id
        }
        expect(response).to render_template(:edit)
      end
    end 


    describe '#update' do
      it 'updates the wishlist and redirects wishlists_path' do
        new_user = FactoryBot.create :user
        patch :update, params: { user: { username: 'newusername', email: 'losvengadores@hotmail.com' }, id: new_user.id }
        expect(response).to redirect_to @user
      end

    end

  end
end
