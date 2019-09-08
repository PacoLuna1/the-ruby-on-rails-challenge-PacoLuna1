# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'UserSignOut', type: :feature do
  before :each do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  it 'when click sign out' do
    visit root_path
    click_link 'SIGN OUT'

    expect(page).to have_link('SIGN IN')
  end
end
