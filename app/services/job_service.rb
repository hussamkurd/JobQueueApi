class JobService
  def self.list_all_jobs
    Job.all
  end

  def self.create_job(params)
    job = Job.new(params)
    if job.save
      job
    else
      raise StandardError, job.errors.full_messages.to_sentence
    end
  end
end
