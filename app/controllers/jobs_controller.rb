class JobsController < ApplicationController
  def index
    @jobs = JobService.list_all_jobs
    render json: @jobs
  end

  def create
    @job = JobService.create_job(job_params)
    render json: @job, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def job_params
    params.require(:job).permit(:title, :status, :priority)
  end
end
