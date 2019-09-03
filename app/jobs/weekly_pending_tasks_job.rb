class WeeklyPendingTasksJob < ApplicationJob
  queue_as :default

  
  def perform
    WeeklyPendingTasksMailer.pending_tasks_email.deliver_now
  end
end
