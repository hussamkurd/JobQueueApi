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


   
