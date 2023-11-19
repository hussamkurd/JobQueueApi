class JobService
  def self.list_all_jobs
    Job.all
  end

  def self.create_job(params)
    job = Job.new(params)
    job.status = 'waiting' #intial status
    if job.save
      JobWorkerJob.perform_async # Trigger processing
      job
    else
      raise StandardError, job.errors.full_messages.to_sentence
    end
  end

  def self.process_jobs
    begin
      priorities = {'critical' => 1, 'high' => 2, 'medium' => 3, 'low' => 4}
      sorted_jobs = Job.where(status: 'waiting')
                       .sort_by { |job| [priorities[job.priority], job.created_at] }
      job = sorted_jobs.first
      if job.nil?
        raise StandardError, 'No jobs available to process'
      end
      job.update!(status: 'in progress')
      p "Job #{job.id}: '#{job.title}' is now under processing"
      sleep(3) # Simulate job processing with a delay
      job.update!(status: 'done')
      p "Job #{job.id}: '#{job.title}' is completed"
      JobWorkerJob.perform_async if Job.where(status: 'waiting').exists?
    rescue => e
      # Handle any other unexpected error
      p "An error occurred: #{e.message}"
    end
    end
end
