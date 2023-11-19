require 'rails_helper'

RSpec.describe JobService do
  describe '.list_all_jobs' do
    let!(:job1) { create(:job, title: "Job 1", status: "waiting", priority: "high") }
    let!(:job2) { create(:job, title: "Job 2", status: "in progress", priority: "medium") }

    it 'returns all jobs' do
      expect(JobService.list_all_jobs).to match_array([job1, job2])
    end
  end

  describe '.create_job' do
    context 'with valid parameters' do
      let(:valid_params) { { title: "Valid Job", status: "waiting", priority: "low" } }

      it 'creates a new job' do
        expect { JobService.create_job(valid_params) }.to change(Job, :count).by(1)
      end

      it 'returns the created job' do
        created_job = JobService.create_job(valid_params)
        expect(created_job.title).to eq("Valid Job")
        expect(created_job.status).to eq("waiting")
        expect(created_job.priority).to eq("low")
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { title: "", status: "unknown", priority: "high" } }

      it 'raises an error' do
        expect { JobService.create_job(invalid_params) }.to raise_error(StandardError)
      end
    end
  end
end
