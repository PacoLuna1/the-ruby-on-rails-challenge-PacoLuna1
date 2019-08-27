# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(password: "some_password", email: "john@doe.com") }

  describe 'associations' do
    it 'has many lists' do
      is_expected.to have_many(:lists)
    end
  end

  describe "Validations" do
    context "when valid" do
      it "needs to have a @ in the email" do
        subject.email = 'expl@gmail'
        expect(subject).to be_valid
      end 
      it 'Has password' do
        is_expected.to validate_presence_of(:email)
      end
      it 'Has password' do
        is_expected.to validate_presence_of(:password)
      end
      it 'has a password longer than 6 characters' do
        is_expected.to validate_length_of(:password).is_at_least(6)
      end
    end

    context "when no valid" do 
      it "is not valid without a @ in the email" do
        subject.email = 'explgmail'
        expect(subject).to_not be_valid
      end 
      it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
      it "is not valid without a password" do 
        subject.password = nil
        expect(subject).to_not be_valid
      end
      it "is not valid with a password shorter than 6 characters " do 
        subject.password = 'pass'
        expect(subject).to_not be_valid
      end
    end
  end
end
