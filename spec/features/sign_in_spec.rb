# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'UserSignIn', type: :feature do
  before :each do
    user = FactoryBot.create(:user)
  end

  it 'with valid email and password' do
    sign_in_with 'tes@example.com', 'f4k3p455w0rd'

    expect(page).to have_content('SIGN OUT')
  end

  it 'with invalid email' do
    sign_in_with 'testexample.com', 'f4k3p455w0rd'

    expect(page).to have_button('SIGN IN')
  end

  it 'with blank password' do
    sign_in_with 'test@example.com', ''

    expect(page).to have_button('SIGN IN')
  end

  it 'with a password with less than 6 words' do
    sign_in_with 'test@example.com', 'f4k3'

    expect(page).to have_button('SIGN IN')
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'SIGN IN'
  end
end
