require 'rails_helper'

RSpec.describe User, type: :model do
  describe ' Model.User' do
    fixtures :users    

    context 'validates field using fixtures' do
      it 'username must be valid' do
        expect(users(:one)).to be_valid
      end
      it 'username must not be valid' do
        users(:one).username = nil
        expect(users(:one)).to_not be_valid
      end      
    end
  end
end
