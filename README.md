# The Ruby on Rails Challenge

## TODO App

You should develop a TODO App that includes the following features

* Users should log in to the App
  * Use Devise/Omniauth
* Users can create, read, update and delete (CRUD) lists of TODOs
* Users cand CRUD tasks on a list
* Users can export their lists with their tasks to CSV and PDF files
* Users should receive a weekly email including pending tasksUsing emails and BackgroundJobs with Sidekiq and Redis
* Users can update your profile: name, email, description and photo
  * Photo must be uploaded, you could use active record for this task
  * (EXTRA POINTS!) Files must be uploaded to an AWS bucket
* The app must include unit tests with Rspec and integration with Capybara
