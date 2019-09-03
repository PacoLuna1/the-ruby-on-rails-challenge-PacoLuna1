class WeeklyPendingTasksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.weekly_pending_tasks_mailer.pending_tasks_email.subject
  #
  
  CONTACT_EMAIL = 'pakoo.1998@gmail.com'
  def pending_tasks_email
    mail(to: CONTACT_EMAIL, subject: 'Pending tasks')
  end
  

end
