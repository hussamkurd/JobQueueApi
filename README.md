# Job Queue API

This Ruby on Rails API is designed for basic queue job processing. It allows for the creation and listing of jobs, each with a title, status, and priority. The jobs are managed in a queue and processed asynchronously, with support for various job statuses like "waiting," "done," "in progress," and "failed," and priority levels such as "critical," "high," "medium," and "low." The project uses Sidekiq for background job processing and is set up to run multiple services concurrently using Foreman.

## Ruby Version

- Ruby 3.2.2

## System Dependencies

- Rails 7.1.2
- MySQL (Database)
- Redis (Required for Sidekiq)
- Sidekiq for background job processing
- Foreman for managing multiple services

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/hussamkurd/JobQueueApi.git
   ```
2. **Install dependencies:**
   ```bash
   bundle install
   gem install foreman
   ```
3. **Database Creation:**
   ```bash
   rails db:create
   rails db:migrate
   ```
## Running the Application with Foreman
  Start the application and all related services using Foreman:
  ```bash
  foreman start
  ```
The default port will be 5000

## API Endpoints

### List Jobs (GET): `/jobs`

Retrieves all jobs along with their statuses.

**Request Example:**
Create Job (POST): /jobs
```json
POST /jobs
Content-Type: application/json

{
  "title": "Job 1",
  "priority": "high"
}
```
**Response Example:**
```json
Status: 201 Created
{
  "id": 1,
  "title": "Job 1",
  "status": "waiting",
  "priority": "high",
  "created_at": "2023-11-19T15:00:00Z",
  "updated_at": "2023-11-19T15:00:00Z"
}
```

**Request Example:**
GET /jobs

**Response Example:**

```json
Status: 200 OK
[
{
  "id": 1,
  "title": "Job 1",
  "status": "waiting",
  "priority": "high",
  "created_at": "2023-11-19T15:00:00Z",
  "updated_at": "2023-11-19T15:00:00Z"
}
]
```
## Background Job Processing
This project uses Sidekiq for processing jobs asynchronously. Jobs are created through the API and are processed based on their priorities ('critical', 'high', 'medium', 'low').
The JobWorkerJob is responsible for picking and executing jobs from the queue.

## How to Run the Test Suite
Execute the following command to run the comprehensive test suite (covering models, controllers, services, and job workers):
```bash
bundle exec rspec
```

   
