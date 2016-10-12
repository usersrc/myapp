require 'rails_helper'

describe UsersController, :type => :controller do
  # let(:user) { User.create!(email: 'peter3@example.com', password: '1234567890') }
  # @user = FactoryGirl.create(:user)
  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { User.create!(email: 'steve3@example.com', password: '2345678901') }

  describe 'GET #show' do
     context 'User is logged in' do
       before do
         sign_in user
       end

       it 'loads correct user details' do
         get :show, id: user.id
         expect(response).to have_http_status(200)
         expect(assigns(:user)).to eq user
       end

     end

     context 'No user is logged in' do

       it 'redirects to login' do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end

     end

     context 'first user cant access second users show page' do
       before do
         sign_in another_user
       end

       it 'should not show another users show page' do
         get :show, id: user.id
         expect(response).not_to be_successful
       end
     end

   end

end
