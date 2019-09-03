# Preview all emails at http://localhost:3000/rails/mailers/weekly_pending_tasks_mailer
class WeeklyPendingTasksMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/weekly_pending_tasks_mailer/pending_tasks_email
  def pending_tasks_email
    WeeklyPendingTasksMailer.pending_tasks_email
  end

end
