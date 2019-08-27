# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    context 'when valid' do
      it 'many tasks belongs a list' do
        is_expected.to belong_to(:list)
      end
      it 'Has title' do
        is_expected.to validate_presence_of(:title)
      end
      it 'Title should have 5 characters minimum' do
        is_expected.to validate_length_of(:title).is_at_least(5)
      end
    end

    context 'when no valid' do
      let(:list) { List.new(title: 'ExampleList') }
      it "hasn't title" do
        task = list.tasks.new(title: nil)
        expect(task).to_not be_valid
      end
      it 'when title is less than 5 characters' do
        task = list.tasks.new(title: 'newt')
        expect(task).to_not be_valid
      end
    end
  end
end
