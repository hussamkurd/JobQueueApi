require 'rails_helper'

RSpec.describe JobWorkerJob, type: :worker do
  describe 'performing the job' do
    it 'enqueues a JobWorkerJob' do
      expect {
        JobWorkerJob.perform_async
      }.to change(JobWorkerJob.jobs, :size).by(1)
    end

    it 'calls JobService.process_jobs' do
      allow(JobService).to receive(:process_jobs)
      JobWorkerJob.new.perform
      expect(JobService).to have_received(:process_jobs)
    end
  end
end
