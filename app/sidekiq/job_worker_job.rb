class JobWorkerJob
  include Sidekiq::Job

  def perform(*args)
   JobService.process_jobs
  end
end
