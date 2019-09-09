# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'UserProfile', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end
  it 'Edit name profile' do
    visit root_path
    click_link('Edit profile')
    edit_user_with('Name Last Name', @user.description, @user.email, @user.password)
    expect(page).to have_content('Name Last Name')
  end

  it 'Edit description profile' do
    visit root_path
    click_link('Edit profile')
    edit_user_with(@user.name, 'Example description', @user.email, @user.password)
    expect(page).to have_content('Example description')
  end

  it 'Change user email' do
    visit root_path
    click_link('Edit profile')
    edit_user_with(@user.name, @user.description, 'newtest@example.com', @user.password)
    expect(page).to have_content('newtest@example.com')
  end

  it 'cancel account' do
    visit root_path
    click_link('Edit profile')
    click_button('Cancel my account')
    expect(page).to have_content('Bye!')
  end

  def edit_user_with(name, description, email, current_password)
    visit edit_user_registration_path
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Email', with: email
    fill_in 'Current password', with: current_password
    click_button('Update')
    click_link('View profile')
  end
end
