require "rails_helper"

RSpec.describe WeeklyPendingTasksMailer, type: :mailer do
  describe "pending_tasks_email" do
    let(:mail) { WeeklyPendingTasksMailer.pending_tasks_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Pending tasks email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
