require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:valid_attributes) { { title: 'Sample Job', status: 'waiting', priority: 'high' } }

  it 'is valid with valid attributes' do
    job = Job.new(valid_attributes)
    expect(job).to be_valid
  end

  it 'is not valid without a title' do
    job = Job.new(valid_attributes.merge(title: nil))
    expect(job).not_to be_valid
    expect(job.errors[:title]).to include("can't be blank")
  end

  it 'is not valid with an invalid status' do
    job = Job.new(valid_attributes.merge(status: 'unknown'))
    expect(job).not_to be_valid
    expect(job.errors[:status]).to include("is not included in the list")
  end

  it 'is not valid with an invalid priority' do
    job = Job.new(valid_attributes.merge(priority: 'unknown'))
    expect(job).not_to be_valid
    expect(job.errors[:priority]).to include("is not included in the list")
  end

  # Add more tests for other valid/invalid statuses and priorities if needed
end
