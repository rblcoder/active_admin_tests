require 'rails_helper'

RSpec.describe Admin::FlagsController, :type => :controller do

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
    
    it 'assigns the flag' do
      get :index
      expect(assigns(:flags)).to include(flag)
    end

    it "should render the expected columns" do
      get :index
      expect(page).to have_content(flag.name)
      # expect(page).to have_content(flag.is_active)
      
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the flag' do
      get :new
      expect(assigns(:flag)).to be_a_new(Flag)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Name')
      expect(page).to have_field('Is active')
      
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Flag" do
        expect {
          post :create, params: { flag: valid_attributes }
        }.to change(Flag, :count).by(1)
      end

      it "assigns a newly created flag as @flag" do
        post :create, params: { flag: valid_attributes }
        expect(assigns(:flag)).to be_a(Flag)
        expect(assigns(:flag)).to be_persisted
      end

      it "redirects to the created flag" do
        post :create, params: { flag: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_flag_path(Flag.last))
      end

      it 'should create the flag' do
        post :create, params: { flag: valid_attributes }
        flag = Flag.last

        expect(flag.name).to eq(valid_attributes[:name])
        expect(flag.is_active).to eq(valid_attributes[:is_active])
       
      end
    end

    context "with invalid params" do
      it 'invalid_attributes return http success' do
        post :create, params: { flag: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      it "assigns a newly created but unsaved flag as @flag" do
        post :create, params: { flag: invalid_attributes }
        expect(assigns(:flag)).to be_a_new(Flag)
      end

      it 'invalid_attributes do not create a Flag' do
        expect do
          post :create, params: { flag: invalid_attributes }
        end.not_to change(Flag, :count)
      end
    end
  end


  describe "GET edit" do
    before do
      get :edit, params: { id: flag.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the flag' do
      expect(assigns(:flag)).to eq(flag)
    end
    it "should render the form elements" do
      expect(page).to have_field('Name', with: flag.name)
      # expect(page).to have_field('Is active', with: flag.is_active)
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      before do
        put :update, params: { id: flag.id, flag: valid_attributes }
      end
      it 'assigns the flag' do
        expect(assigns(:flag)).to eq(flag)
      end
      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_flag_path(flag))
      end
      it "should update the flag" do
        flag.reload

        expect(flag.name).to  eq(valid_attributes[:name])
        expect(flag.is_active).to eq(valid_attributes[:is_active])
        
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        put :update, params: { id: flag.id, flag: invalid_attributes }
        expect(response).to have_http_status(:success)
      end
      it 'does not change flag' do
        expect do
          put :update, params: { id: flag.id, flag: invalid_attributes }
        end.not_to change { flag.reload.name }
      end
    end
  end

  describe "GET show" do
    before do
      get :show, params: { id: flag.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the flag' do
      expect(assigns(:flag)).to eq(flag)
    end
    it "should render the form elements" do
      expect(page).to have_content(flag.name)
      # expect(page).to have_content(flag.is_active)
      
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      expect {
        delete :destroy, params: { id: flag.id }
      }.to change(Flag, :count).by(-1)
    end
    
    it "redirects to the field" do
      delete :destroy, params: { id: flag.id }
      expect(response).to redirect_to(admin_flags_path)
    end
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

end
