# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'associations' do
    it 'should have many tasks' do
      is_expected.to have_many(:tasks)
    end
  end

  describe 'validations' do
    context 'when valid' do
      it 'Has title' do
        is_expected.to validate_presence_of(:title)
      end
      it 'Title should have 5 characters minimum' do
        is_expected.to validate_length_of(:title).is_at_least(5)
      end
    end

    context 'when no valid' do
      it "hasn't title" do
        list = List.new(title: nil, user_id: 1)
        expect(list).to_not be_valid
      end
      it 'when title is less than 5 characters' do
        list = List.new(title: 'new', user_id: 1)
        expect(list).to_not be_valid
      end
    end
  end
end
