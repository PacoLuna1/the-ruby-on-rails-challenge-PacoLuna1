# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeeklyPendingTasksMailer, type: :mailer do
  describe 'pending_tasks_email' do
    let(:mail) { WeeklyPendingTasksMailer.pending_tasks_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Pending tasks')
      expect(mail.to).to eq(['pakoo.1998@gmail.com'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(' ')
    end
  end
end
