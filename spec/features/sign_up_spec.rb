# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'UserSignUp', type: :feature do
  it 'with valid email and password' do
    sign_up_with('valid@example.com ', 'password', 'password')

    expect(page).to have_content('SIGN OUT')
  end

  it 'with invalid email' do
    sign_up_with 'validexample.com', 'password', 'password'

    expect(page).to have_button('SIGN UP')
  end

  it 'with blank password' do
    sign_up_with 'valid@example.com', '', ''

    expect(page).to have_button('SIGN UP')
  end

  it 'with a password with less than 6 words' do
    sign_up_with 'valid@example.com', 'pass', 'pass'

    expect(page).to have_button('SIGN UP')
  end

  def sign_up_with(email, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password(6 characters minimum)', with: password
    fill_in 'Password Confirmation', with: password_confirmation
    click_button 'SIGN UP'
  end
end
