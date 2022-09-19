require 'rails_helper'

RSpec.describe Admin::UsersController, :type => :controller do

  # this lets us inspect the rendered results
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) } 
  let(:user) { Fabricate :user } 
  before { sign_in user } 

  let!(:flag) { Fabricate :flag }

  let(:valid_attributes) do
    Fabricate.attributes_for :flag
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    

  end

end


# require 'rails_helper'

# RSpec.describe "Flags", type: :request do
#   describe "not logged in" do
#     it "redirects to root page" do
#       get admin_dashboard_path
#       expect(response).to redirect_to new_user_session_path
#     end
 
#   end

#   describe 'logged in' do
#     # fixtures :users
  
#     it 'access dashboard' do
#       @user = User.create(email: "admin1@example.com", password: "password")
#       sign_in @user
#       # karl.get '/admin/flags'
#       # karl.response.code.should eq '200'
#       # get admin_dashboard_path
#       # get admin_dashboard_path
#       # expect(page).to include('Flags')
#       get admin_user_url
#       assert_response :success
#       # karl.xhr :put, "/users/#{users(:bob).id}", id: users(:bob).id,
#       #   "#{users(:bob).id}-is-funny" => 'true'
  
#       # karl.response.code.should eq '200'
#       # User.find(users(:bob).id).should be_funny
  
#       # bob = login_as :bob
#       # expect { bob.get '/admin/flags' }.to_not raise_exception
  
#       # bob.response.code.should eq '200'
#     end
#   end


#   # describe "logged in" do
#   #   before(:each) do
#   #     DatabaseCleaner.clean_with(:truncation)
#   #     @flag = Flag.create!(name: "Feature1", is_active: true)
      
#   #     @user = User.create!(email: "admin1@example.com", password: "password")
#   #     # user = users(:one)
#   #     # get new_user_session_path
#   #     # post user_session_path, params: { session: { email: user.email, password: user.password} }

#   #     post user_session_path, params: {
#   #       user: {
#   #         email: @user.email, password: @user.password
#   #       }
#   #     }
#   #     follow_redirect!

#   #   end

   
#   #   context "when logged in" do
#   #     # before { sign_in @user }

#   #     it "opens the page" do
#   #       # post user_session_path, params: { session: { email: @user.email, password: @user.password} }
#   #       # sign_in @user
#   #       # post user_session_path, :email => @user.email, :password => @user.password
#   #       get admin_dashboard_path
#   #       # puts response
#   #       expect(response).to be_success
#   #     end
#   #   end



#     # it "opens index page" do
#     #   get "/admin/flags"
#     #   expect(response).to have_http_status(:ok)
#     #   expect(response.content_type).to eq("application/json; charset=utf-8")

#     #   get "/admin/flags/#{@flag.id}"
#     #   expect(response).to have_http_status(:ok)
#     #   expect(response.content_type).to eq("application/json; charset=utf-8")
#     # end

#     # after(:each) do
#     #   DatabaseCleaner.clean_with(:truncation)
#     # end
#   # end
# end