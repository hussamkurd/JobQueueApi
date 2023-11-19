require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe "GET #index" do
    before do
      create_list(:job, 3) # Create 3 jobs using FactoryBot
      get :index
    end

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns all jobs" do
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { title: 'New Job', priority: 'high' } }

      it "creates a new Job" do
        expect {
          post :create, params: { job: valid_attributes }
        }.to change(Job, :count).by(1)
      end

      it "returns a created status" do
        post :create, params: { job: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { title: '', priority: 'unknown' } }

      it "does not create a new Job" do
        expect {
          post :create, params: { job: invalid_attributes }
        }.to change(Job, :count).by(0)
      end

      it "returns an unprocessable entity status" do
        post :create, params: { job: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
